require "./widget"

module Lcui
  class TextView < Widget
    def initialize(@text : String, props)
      super(props)
      set_text
    end

    def self.make(text : String, **opts)
      self.new(text, Props.new("textview", **opts))
    end

    def set_text
      LibLCUI.button_set_text(@native, @text)
    end
  end
end
