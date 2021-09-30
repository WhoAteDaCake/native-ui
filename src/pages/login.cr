require "../slack"

module Pages
  class Login < Lcui::Page
    property url = "/login"
    property prefix = "login_page"
    property error : Lcui::TextView

    def initialize(@root)
      @error = Lcui::TextView.make("")

      @container = Lcui::Widget.make
        .add_class(@prefix)
      @container = @container.append(Lcui::Widget.make
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
                text = team.sync_text
                s_team = Slack.team(text)
                if @container.has_child?(@error)
                  @container.unmount(@error)
                end
                if s_team.is_a?(Slack::SError)
                  @error.text(s_team.error)
                  @container.append(@error)
                else
                  puts s_team
                end
              end
            ),
        )
      )
    end
  end
end
