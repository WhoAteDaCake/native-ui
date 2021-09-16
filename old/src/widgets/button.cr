require "../LibLCUI.cr"
require "../lcui.cr"
require "./widget"
require "./textview"

class Button < TextView
  def initialize(text : String, **opts)
    super("button", text, **opts)
  end
 
  def on_click(&callback : Lcui::EventCallback)
    bind_event("click", callback)
  end

  def on_click(callback : Lcui::EventCallback)
    bind_event("click", callback)
  end
end