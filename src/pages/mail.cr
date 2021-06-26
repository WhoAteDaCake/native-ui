require "./page"

class MailPage
  include Page
  property container : Widget
  property url = "/mail/:id"

  def initialize()
    @container = Widget.new
  end

  def on_mount(params)
    text = TextView.new
    text.set_text(params["id"])
    @container.append_child(text)
  end
end