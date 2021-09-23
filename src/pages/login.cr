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
            Lcui::TextEdit.make(
              placeholder: "Please enter your team name"
            ),
          ] of Lcui::Widget
        )]
      )
    end
  end
end
