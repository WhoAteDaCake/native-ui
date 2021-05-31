require "./LibLCUI.cr"

module Lcui
  @@css : Array(String) = Array(String).new
  alias EventCallback = (LibLCUI::LcuiWidgetRec, LibLCUI::LcuiWidgetEventRec) ->

  def self.register_css(css : String)
    @@css << css
  end

  def self.load_css()
    @@css.each do |css|
      status = LibLCUI.lcui_load_css_string(css, __DIR__)
      if status != 0
        raise "Failed to load CSS: #{status}"
      end
    end
    @@css.clear
  end
end