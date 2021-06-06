require "log"
require "json"
require "http/server"
require "uri"
require "http/client"

require "./storage"

CLIENT_ID="236467804844-87phejf0vcq86rhc93ud679b1maul3i9.apps.googleusercontent.com"
CLIENT_SECRET="vUhYtrbFHmjy4oDoJTCx9lFZ"

PORT = 9006
ENDPOINT = "https://accounts.google.com/o/oauth2/v2/auth"
TOKEN_ENDPOINT = "https://oauth2.googleapis.com/token"
SCOPES = [
  "https://mail.google.com/",
  "https://www.googleapis.com/auth/userinfo.email",
  "https://www.googleapis.com/auth/userinfo.profile",
].join(" ")

REQUEST_URL = URI.encode("#{ENDPOINT}?client_id=#{CLIENT_ID}&redirect_uri=http://127.0.0.1:#{PORT}&response_type=code&access_type=offline&prompt=select_account&scope=#{SCOPES}")

struct OauthResponse
  include JSON::Serializable

  property access_token : String
  property expires_in : Int64
  property id_token : String
  property scope : String
  property token_type : String
end

class Token
  include JSON::Serializable
  
  property internal : OauthResponse
  property expires_on : Time
  property refresh_token : String

  def initialize(@internal, @refresh_token)
    @expires_on = Time.utc + Time::Span.new(seconds: @internal.expires_in)
  end

  def update(@internal)
    @expires_on = Time.utc + Time::Span.new(seconds: @internal.expires_in)
  end

  def header()
    "#{@internal.token_type} #{@internal.access_token}"
  end
end

class Auth
  enum TokenRequest
    Refresh
    Authorise
  end

  Logger = Log.for("auth", :debug)

  property storage : Storage
  property token : Token | Nil

  def initialize(@storage)
  end

  def token_request(request : TokenRequest, code : String)
    params = HTTP::Params.new
    params.add("client_id", CLIENT_ID)
    params.add("client_secret", CLIENT_SECRET)
    params.add("redirect_uri", "http://127.0.0.1:#{PORT}")
    case request
      in TokenRequest::Authorise
        params.add("code", code)
        params.add("grant_type", "authorization_code")
      in TokenRequest::Refresh
        params.add("refresh_token", code)
        params.add("grant_type", "refresh_token")
    end
    url = "#{TOKEN_ENDPOINT}?#{params.to_s}"

    response = HTTP::Client.post url
    p! response
    data = OauthResponse.from_json(response.body)
    refresh_token = nil
    if request == TokenRequest::Authorise
      raw_dict = Hash(String, JSON::Any).from_json(response.body)
      refresh_token = raw_dict["refresh_token"].as_s
    end
    
    {data, refresh_token}
  end

  def retrieve_auth_response()
    channel = Channel(Token).new

    server = HTTP::Server.new do |context|
      code = context.request.query_params["code"]
      context.response.content_type = "text/plain"
      context.response.print "Please close the window and go back to the Application"
      auth, refresh_token = token_request(TokenRequest::Authorise, code)
      # TODO: better failure handling ?
      if refresh_token.nil?
        raise Exception.new("Got no refresh token from authorisation request")
      else
        channel.send(Token.new(auth, refresh_token))
      end
    end
    
    address = server.bind_tcp PORT
    spawn do
      server.listen
    end

    output = channel.receive
    server.close
    output
  end

  def save_token(token : Token)
    @token = token
    args = [] of DB::Any
    args << token.to_json()
    @storage.conn.exec "
      insert into config (key, value)
      values ('token', ?)
    ", args: args
  end

  def from_storage()
    token = nil
    @storage.conn.query "
      select value
      from config
      where key = 'token'
    " do | rs |
      rs.each do
        token = Token.from_json(rs.read(String))
      end
    end
    token
  end

  def refresh_token()
    token = @token
    if !token.nil?
      if token.expires_on < Time.utc
        Logger.info { "Token has expired, refreshing" }
        auth, _ = token_request(TokenRequest::Refresh, token.refresh_token)
        token.update(auth) 
        @token = token
      else
        Logger.info { "Token valid till #{token.expires_on.to_local}, continue" }
      end
    end
  end

  def login()
    @token = from_storage()
    if @token.nil?
      Logger.info { "Token not found requesting auth" }
      # TODO: support different browsers ?
      Process.run("xdg-open", [REQUEST_URL])
      token = retrieve_auth_response()
      save_token(token)
    end
    refresh_token()
  end
end