require "../lcui"

Lcui.register_sass("
  .login_page {
    display: flex;
    justify-content: center;
    align-items: center;
  }
")

class LoginPage
  property container : Widget
  property button : Widget
  
  def initialize()
    @container = Widget.new
    @container.add_class("login_page")

    @button = Button.new("Login with Gmail")
    @container.append_child(@button)
  end
end