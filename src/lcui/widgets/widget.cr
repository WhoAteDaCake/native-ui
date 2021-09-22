require "../liblcui.cr"

# require "./lcui.cr"

module Lcui
  alias NativeWidget = LibLCUI::LcuiWidget

  class Widget
    record Props,
      tag : String,
      children : Array(Widget)? = nil,
      callbacks : Events::Handler? = nil,
      classes : Array(String)? = nil

    property native : NativeWidget
    property children = [] of Widget
    property callbacks : Events::Handler? = nil
    # If we passed a native widget, we don't need to destroy
    @is_ref = false

    def initialize(props_or_native : Props | NativeWidget)
      if props_or_native.is_a?(NativeWidget)
        @is_ref = true
        @native = props_or_native
      else
        props = props_or_native
        @native = LibLCUI.lcui_widget_new(props.tag)
        props.children.try do |c|
          @children = c
          append(c)
        end
        props.classes.try { |cnames| add_class(cnames) }
        @callbacks = props.callbacks
        @callbacks.try { |cb| cb.bind(self) }
      end
    end

    def finalize
      return if @is_ref
      @children.clear
      # LCUI will unmount and destroy widgets internally, no
      # need for us to do that
      LibLCUI.widget_destroy(@native)
    end

    def self.make(tag : String, **opts)
      self.new(Props.new(tag, **opts))
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
  end
  #   def unmount_child(widget : Widget)
  #     @children.select! do |child|
  #       child.hash != widget.hash
  #     end
  #     LibLCUI.widget_unlink(widget.internal)
  #   end

  #   def remove_children
  #     LibLCUI.widget_destroy_children(@native)
  #   end
end
