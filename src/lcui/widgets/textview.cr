require "./widget"

module Lcui
  class TextView < Widget
    property text : String?

    def initialize(type_or_native : String | NativeWidget, text : String? = nil)
      super(type_or_native)
      text.try do |txt|
        @text = txt
        text(txt)
      end
    end

    def self.make(text : String)
      self.new("textview", text)
    end

    def text(text : String)
      @text = text
      LibLCUI.text_view_set_text(@native, text)
      self
    end
  end
end
