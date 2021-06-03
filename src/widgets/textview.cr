require "../LibLCUI.cr"
require "./widget"

class TextView < Widget
  def initialize() 
    super("textview")
  end

  def set_color(color : LibLCUI::LcuiColor)
    LibLCUI.text_view_set_color(@internal, color)
  end
end