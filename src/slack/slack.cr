require "http"
require "json"

# require "http"
# require "json"
# require "./slack/**"

# # data = Slack::ConversationMeta.from_json(%({"id":"G1HDV2DR9","name":"spotlight-data","is_channel":false,"is_group":true,"is_im":false,"created":1466077666,"is_archived":false,"is_general":false,"unlinked":0,"name_normalized":"spotlight-data","is_shared":false,"is_frozen":false,"parent_conversation":null,"creator":"U0CUURR5X","is_ext_shared":false,"is_org_shared":false,"shared_team_ids":["T0CUURR5F"],"pending_shared":[],"pending_connected_team_ids":[],"is_pending_ext_shared":false,"is_member":true,"is_private":true,"is_mpim":false,"last_read":"1626686500.000200","is_open":true,"topic":{"value":"Spotlight Data only chat","creator":"U0CUURR5X","last_set":1493048940},"purpose":{"value":"","creator":"U0CUURR5X","last_set":1466078743},"priority":0}))

# client = Slack::Client.new(ENV["TOKEN"], "T0CUURR5F")
# data = client.get("conversations.list", {"types" => ["public_channel,private_channel,mpim,im"]})
# data = data.map { |r| Slack::ConversationsAll.from_json(r) }

# if data.is_a?(Slack::SError)
#   puts data.error
# end

# # puts client.get("conversations.list")
# # team = Slack.team "spotlightdata"
# # if team.is_a?(Slack::Team)
# #   puts team.team_id
# #   resp = Slack.signin(team.team_id, ENV["EMAIL"], ENV["PASSWORD"])
# #   puts resp
# # else
# #   puts team.error
# # end

module Slack
  API     = "https://slack.com/api"
  HEADERS = HTTP::Headers{"Content-Type" => "application/x-www-form-urlencoded; charset=utf-8"}

  struct SError
    property error : String

    def initialize(@error)
    end

    def map(&block : String -> B) forall B
      self
    end
  end

  struct SData(T)
    property raw : T

    def initialize(@raw : T)
    end

    def map(&block : T -> B) forall B
      SData(B).new(yield @raw)
    end
  end

  def self.parse(raw)
    parsed = Hash(String, JSON::Any).from_json(raw)
    if parsed["ok"].as_bool
      SData.new(raw)
    else
      SError.new(parsed["error"].as_s)
    end
  end

  def self.request(endpoint, form, headers = HEADERS)
    response = HTTP::Client.post(
      "#{API}/#{endpoint}",
      headers: headers,
      form: form
    )
    parse(response.body)
  end

  def self.team(domain)
    data = request("auth.findTeam", {"domain" => domain})
    data.map Team.from_json
  end

  def self.signin(team, email, password)
    data = request("auth.signin", {"email" => email, "password" => password, "team" => team})
    data.map do |raw|
      Client.new(Hash(String, JSON::Any).from_json(raw)["token"].as_s)
    end
  end

  class Client
    def initialize(@token : String, @team_id : String)
      @headers = HTTP::Headers{
        "Authorization" => "Bearer #{@token}",
        "Content-Type"  => "application/x-www-form-urlencoded; charset=utf-8",
      }
    end

    def get(endpoint, params = nil)
      url = URI.parse("#{API}/#{endpoint}")
      if params
        p = params.clone
        p["team_id"] = [@team_id]
        url.query_params = HTTP::Params.new(p)
      end
      response = HTTP::Client.get(url, headers: @headers)
      Slack.parse(response.body)
    end

    def channels
    end
  end
end
