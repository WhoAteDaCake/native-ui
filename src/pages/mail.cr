require "./page"

class MailPage
  include Page
  property container : Widget
  property url = "/mail/:id"
  property auth : Auth

  def initialize(@auth)
    @container = Widget.new
    @container.add_class("full-size")
  end

  def on_mount(params)
    text = TextView.new
    text.set_text(params["id"])
    @container.append_child(text)
  end
end