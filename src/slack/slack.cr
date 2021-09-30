require "http"
require "json"

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
    data.map { |r| Team.from_json r }
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
