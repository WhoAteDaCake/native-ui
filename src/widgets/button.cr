require "../LibLCUI.cr"
require "../lcui.cr"
require "./widget"

class Button
  property widget : Widget

  # Inherited
  delegate set_text, to: @widget

  def initialize(text : String)
    @widget = Widget.new("button")
    @widget.set_text(text)
  end
 
  def on_click(&callback : Lcui::EventCallback)
    @widget.bind_event("click", callback)
  end
end