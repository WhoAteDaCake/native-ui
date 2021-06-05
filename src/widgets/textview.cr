require "../LibLCUI.cr"
require "./widget"

class TextView < Widget
  def initialize() 
    super("textview")
  end

  def initialize(proto_name : String)
    super(proto_name)
  end

  def set_color(color : LibLCUI::LcuiColor)
    LibLCUI.text_view_set_color(@internal, color)
  end

  def set_text(text : String)
    LibLCUI.text_view_set_text(@internal, text)
  end
end