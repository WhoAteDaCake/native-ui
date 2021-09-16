require "json"

module Slack
  # https://api.slack.com/types/conversations
  # https://api.slack.com/docs/conversations-api
  module ConversationBase
    property id : String
    property priority : Int64?

    # Types
    property is_frozen : Bool
    property is_archived : Bool
    # Conversation between real people or bots
    property is_im : Bool
  end

  # https://api.slack.com/types/conversations
  class ConversationMeta
    include JSON::Serializable
    include ConversationBase

    property name : String
    property name_normalized : String
    property num_members : Int64?

    # Types
    property is_mpim : Bool
    property is_group : Bool
    property is_channel : Bool
    property is_shared : Bool
  end

  class DirectConversationMeta
    include JSON::Serializable
    include ConversationBase

    property user : String
    property is_user_deleted : Bool
  end

  class ConversationsAll
    include JSON::Serializable
    property channels : Array(DirectConversationMeta | ConversationMeta)
  end
end
