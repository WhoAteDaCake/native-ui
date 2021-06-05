require "../LibLCUI.cr"
require "../lcui.cr"
require "./widget"
require "./textview"

class Button < TextView
  def initialize(text : String)
    super("button")
    set_text(text)
  end
 
  def on_click(&callback : Lcui::EventCallback)
    bind_event("click", callback)
  end

  def on_click(callback : Lcui::EventCallback)
    bind_event("click", callback)
  end
end