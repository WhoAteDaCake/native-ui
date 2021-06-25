require "http/client"
require "json"
require "./auth"
require "uri/params"

class Mail
  module WithHistory
    include JSON::Serializable
    @[JSON::Field(key: "historyId")]
    property history_id : String
  end

  module WithDate
    include JSON::Serializable
    @[JSON::Field(key: "internalDate")]
    property internal_date : String 
  end

  module WithSize
    include JSON::Serializable
    @[JSON::Field(key: "sizeEstimate")]
    property size_estimate : Int64 
  end

  module MessageBareContent
    include JSON::Serializable

    property id : String
    @[JSON::Field(key: "threadId")]
    property thread_id : String
  end

  struct MessageBare
    include JSON::Serializable
    include MessageBareContent
  end

  struct NameValue
    include JSON::Serializable
    property name : String
    property value : String
  end

  struct MessageMetaPayload
    include JSON::Serializable
    # include WithHistory
    # include WithDate
    
    @[JSON::Field(key: "mimeType")]
    property mime_type : String
    property headers : Array(NameValue)
  end

  # https://developers.google.com/gmail/api/reference/rest/v1/users.messages/get
  # format=metadata
  # https://developers.google.com/gmail/api/reference/rest/v1/users.messages#Message
  struct MessageMeta
    include JSON::Serializable
    include WithHistory
    include WithDate
    include WithSize
    include MessageBareContent

    @[JSON::Field(key: "labelIds")]
    property label_ids : Array(String)
    property snippet : String

    property payload : MessageMetaPayload
  end

  # https://developers.google.com/gmail/api/reference/rest/v1/users.messages/list
  struct MessagesList
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
  end

  def url(suffix)
    "https://gmail.googleapis.com/gmail/v1/users/#{@user.id}/#{suffix}"
  end

  def url(suffix, params)
    params = params.reduce(URI::Params.new) do |acc, kv|
      key, value = kv
      acc[key] = value
      acc
    end
    url(suffix + "?#{params.to_s}")
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

  def request(endpoint, params)
    HTTP::Client.get(url(endpoint, params), headers)
  end

  def load_email_meta()
    @auth.refresh_token
    response = request("messages", {"maxResults" => "15" })
    cursor = MessagesList.from_json(response.body)
    cursor.messages.map do |m|
      resp = request("messages/#{m.id}", { "format" => "metadata" } )
      MessageMeta.from_json(resp.body)
    end
  end
end