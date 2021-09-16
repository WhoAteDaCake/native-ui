require "json"

module Slack
  struct Team
    include JSON::Serializable
    property team_id : String
    property team_name : String
    property team_icons : Hash(String, String)
  end
end
