require "./widget"

module Lcui
  class TextView < Widget
    property text : String

    def initialize(@text, props)
      super(props)
      set_text(@text)
    end

    def self.make(text : String, **opts)
      self.new(text, Props.new("textview", **opts))
    end

    def set_text(text)
      @text = text
      LibLCUI.button_set_text(@native, @text)
    end
  end
end
