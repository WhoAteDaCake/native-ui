require "http/client"
require "json"
require "./auth"

class Mail
  # https://developers.google.com/gmail/api/reference/rest/v1/users.messages/list
  struct MessagesList
    struct MessageBare
      include JSON::Serializable

      property id : String
      @[JSON::Field(key: "threadId")]
      property thread_id : String
    end

    include JSON::Serializable

    property messages : Array(MessageBare)
    @[JSON::Field(key: "nextPageToken")]
    property next_page_token
    
    @[JSON::Field(key: "resultSizeEstimate")]
    property size_estimate
  end

  
  @auth : Auth
  @user : GmailUser

  def initialize(@auth)
    @user = @auth.get_user
    load_emails()
  end

  def url(suffix)
    "https://gmail.googleapis.com/gmail/v1/users/#{@user.id}/#{suffix}"
  end

  def headers()
    token = @auth.get_token
    headers = HTTP::Headers.new
    headers["Authorization"] = token.header
    headers
  end

  def request(endpoint)
    HTTP::Client.get(url(endpoint), headers)
  end

  def load_emails()
    response = request "messages"
    messages = MessagesList.from_json(response.body)
    puts "--------------"
    puts messages
  end
end