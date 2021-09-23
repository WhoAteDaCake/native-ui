require "./widget"

module Lcui
  class TextView < Widget
    record TextViewProps,
      text : String,
      props : Props

    property text : String

    def initialize(props : TextViewProps)
      super(props.props)
      # Need this because crystal doesn't allow
      # instance variables not be initialized
      @text = props.text
      set_text(props.text)
    end

    def self.parse(tag : String, text : String? = nil, **opts)
      TextViewProps.new(text || "", Props.new(tag, **opts))
    end

    def self.make(text : String, **opts)
      self.new(parse("textview", text, **opts))
    end

    def set_text(text)
      @text = text
      LibLCUI.button_set_text(@native, @text)
    end
  end
end
