require "../LibLCUI.cr"
require "./widget"

class TextView < Widget
  def initialize(
    proto : String,
    text : String,
    **opts
  )
    super(LibLCUI.lcui_widget_new(proto), **opts)
    if text
      set_text(text)
    end
  end

  # Need a separate option here because Button class 
  # won't have easy access otherwise
  # due to proto string being overriden
  def self.make(text, **opts)
    TextView.new("textview", text, **opts)
  end


  def set_color(color : LibLCUI::LcuiColor)
    LibLCUI.text_view_set_color(@internal, color)
  end

  def set_text(text : String)
    LibLCUI.text_view_set_text(@internal, text)
  end
end