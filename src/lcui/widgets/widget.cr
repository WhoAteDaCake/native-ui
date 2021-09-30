require "../liblcui.cr"

# require "./lcui.cr"

module Lcui
  alias NativeWidget = LibLCUI::LcuiWidget

  class Widget
    # record Props,
    #   tag : String,
    #   children : Array(Widget)? = nil,
    #   callbacks : Events::Handler? = nil,
    #   classes : Array(String)? = nil

    property native : NativeWidget
    property children = [] of Widget
    property callbacks : Events::Handler? = nil
    property hash : LibC::UInt
    # If we passed a native widget, we don't need to destroy
    @is_ref = false

    def initialize(type_or_native : String | NativeWidget)
      if type_or_native.is_a?(NativeWidget)
        @is_ref = true
        @native = type_or_native
        @hash = @native.value.hash
      else
        props = type_or_native
        @native = LibLCUI.lcui_widget_new(type_or_native)
        @hash = @native.value.hash
        # props.children.try { |c| append(c) }
        # props.classes.try { |cnames| add_class(cnames) }
        # @callbacks = props.callbacks
        # @callbacks.try { |cb| cb.bind(self) }
      end
    end

    def callbacks(handler : Events::Handler)
      @callbacks = handler
      handler.bind(self)
      self
    end

    def finalize
      return if @is_ref
      @children.clear
      # LCUI will unmount and destroy widgets internally, no
      # need for us to do that
      LibLCUI.widget_destroy(@native)
    end

    def self.make(tag : String)
      self.new(tag)
    end

    def self.make
      self.new("widget")
    end

    def self.reuse(widget : NativeWidget)
      self.new(widget)
    end

    def self.root
      self.new(LibLCUI.lcui_widget_get_root)
    end

    def append(*widgets : Widget)
      append(widgets.to_a)
    end

    def append(widgets : Array(Widget))
      widgets.each do |widget|
        LibLCUI.widget_append(@native, widget.native)
        @children << widget
      end
      self
    end

    def add_class(*cnames : String)
      add_class(cnames.to_a)
    end

    def add_class(cnames : Array(String))
      cnames.each { |c| LibLCUI.widget_add_class(@native, c) }
      self
    end

    def has_class(cname : String)
      result = LibLCUI.widget_has_class(@native, cname)
      Lcui.to_bool result
    end

    def remove_class(cname : String)
      LibLCUI.remove_class(@native, cname)
    end

    def set_attr(name : String, value : String)
      LibLCUI.widget_set_attribute(@native, name, value)
    end

    def get_attr(name : String)
      attr = LibLCUI.widget_get_attribute(@native, name)
      if attr.null?
        nil
      else
        String.new(attr)
      end
    end

    def style(name : String, value : String)
      LibLCUI.widget_set_style_string(@native, name, value)
      self
    end

    def has_child?(widget : Widget)
      @children.select { |w| w.hash == widget.hash }.size != 0
    end

    def unmount(widget : Widget)
      @children.select! do |child|
        child.hash != widget.hash
      end
      LibLCUI.widget_unlink(widget.native)
    end
  end
end
