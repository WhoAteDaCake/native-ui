module Pages
  class Login < Lcui::Page
    property url = "/login"
    property prefix = "login_page"

    def initialize(@root)
      @container = Lcui::Widget.make(
        classes: [@prefix],
        children: [Lcui::Widget.make(
          classes: ["#{@prefix}_container"],
          children: [
            Lcui::TextView.make(
              "Team name"
            ),
            team = Lcui::TextEdit.make(
              placeholder: "Please enter your team name"
            ),
            Lcui::Button.make(
              text: "Submit",
              callbacks: Lcui::Events.handler.on("click") do |w, e|
                puts team.synced_text
              end
            ),
          ] of Lcui::Widget
        )]
      )
    end
  end
end
