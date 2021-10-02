require "../slack"

module Pages
  class Login < Lcui::Page
    property url = "/login"
    property prefix = "login"

    def initialize(@root)
      @container = Lcui::Widget.make
        .add_class(@prefix)
        .append(
          Lcui::Widget.make
            .add_class("#{@prefix}_container")
            .append(
              Lcui::TextView.make("Username/Password"),
              username = Lcui::TextEdit.make(
                placeholder: "Username"
              ),
              password = Lcui::TextEdit.make(
                placeholder: "Password"
              ),
              Lcui::Button.make("Submit")
            )
        )
      # @description = Lcui::TextView.make("")
      # @container = Lcui::Widget.make
      #   .add_class(@prefix)
      # @container.append(Lcui::Widget.make
      #   .add_class("#{@prefix}_container")
      #   .append(
      #     Lcui::TextView.make(
      #       "Team name"
      #     ),
      #     team = Lcui::TextEdit.make(
      #       placeholder: "Please enter your team name"
      #     ),
      #     Lcui::Button.make("Submit")
      #       .callbacks(
      #         Lcui::Events.handler.on("click") do |w, e|
      #           @description.text("Loading")
      #           text = team.sync_text
      #           s_team = Slack.team(text)
      #           if s_team.is_a?(Slack::SError)
      #             @description.text(s_team.error)
      #           else
      #             State.get.update(
      #               State::Internal.new(State::WithTeam.new(s_team.raw)))
      #           end
      #         end
      #       ),
      #   ), @description
      # )
    end
  end
end
