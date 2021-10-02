require "../slack"

module Pages
  class TeamSelect < Lcui::Page
    property url = "/team_select"
    property prefix = "team_select_page"
    property description : Lcui::TextView

    def initialize(@root)
      @description = Lcui::TextView.make("")

      @container = Lcui::Widget.make
        .add_class(@prefix)
      @container.append(Lcui::Widget.make
        .add_class("#{@prefix}_container")
        .append(
          Lcui::TextView.make(
            "Team name"
          ),
          team = Lcui::TextEdit.make(
            placeholder: "Please enter your team name"
          ),
          Lcui::Button.make("Submit")
            .callbacks(
              Lcui::Events.handler.on("click") do |w, e|
                @description.text("Loading")
                text = team.sync_text
                s_team = Slack.team(text)
                if s_team.is_a?(Slack::SError)
                  @description.text(s_team.error)
                else
                  @description.text("")
                  State.get.update(
                    State::Internal.new(State::WithTeam.new(s_team.raw)))
                  Lcui::Router::Global.push("/login")
                end
              end
            ),
        ), @description
      )
    end
  end
end
