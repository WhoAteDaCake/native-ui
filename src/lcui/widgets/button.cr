require "./widget"

module Lcui
  class Button < Widget
    def initialize(@text : String, props)
      super(props)
      set_text
    end

    def self.make(text : String, **opts)
      self.new(text, Props.new("button", **opts))
    end

    def set_text
      LibLCUI.text_view_set_text(@native, @text)
    end
  end
end
