require "./liblcui.cr"
require "./lcui.cr"

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
        props.callbacks.try { |cb| cb.register(self) }
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
      Widget.new(Props.new(tag, **opts))
    end

    def self.reuse(widget : NativeWidget)
      Widget.new(widget)
    end

    def self.root
      Widget.new(LibLCUI.lcui_widget_get_root)
    end

    def append(*widgets : Widget)
      append(widgets.to_a)
    end

    def append(widgets : Array(Widget))
      widgets.each do |widget|
        LibLCUI.widget_append(@native, widget.native)
        @children << widget
      end
    end

    def add_class(*cnames : String)
      add_class(cnames.to_a)
    end

    def add_class(cnames : Array(String))
      cnames.each { |c| LibLCUI.widget_add_class(@native, c) }
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

  # class Widget
  #   @@id : Int64 = 0
  #   alias EventHash = Hash(LibC::Int, Pointer(Void))

  #   property id : Int64
  #   @box : EventHash
  #   @children : Array(Widget)
  #   @cleared : Bool = false
  #   # if we passed already used pointer to get api access
  #   @indirect : Bool = false

  #   def self.root
  #     Widget.new(LibLCUI.lcui_widget_get_root)
  #   end

  #   def initialize(
  #     internal : LibLCUI::LcuiWidget,
  #     classes : Array(String) | Nil = nil,
  #     children : Array(Widget) | Nil = nil,
  #     indirect : Bool = false,
  #     events : Hash(String, Lcui::EventCallback | EventCallback) | Nil = nil
  #   )
  #     @native = internal
  #     @box = EventHash.new
  #     @children = Array(Widget).new
  #     @id = @@id
  #     @@id += 1
  #     # Set properties
  #     @indirect = indirect
  #     if children
  #       children.each { |c| append_child c }
  #     end
  #     if classes
  #       classes.each { |c| add_class c }
  #     end
  #     if events
  #       events.each { |k, v| bind_event(k, v) }
  #     end
  #   end

  #   def self.make_proto(proto_name : String, **opts)
  #     Widget.new(LibLCUI.lcui_widget_new(proto_name), **opts)
  #   end

  #   def self.make(**opts)
  #     Widget.make_proto("widget", **opts)
  #   end

  #   def ptr
  #     @native
  #   end

  #     #   def bind_event(event : String, callback : Lcui::EventCallback)
  #     boxed_data = Box.box(callback)
  #     event_id = LibLCUI.widget_bind_event(internal, event, ->(me, event, _data) {
  #       data_as_callback = Box(typeof(callback)).unbox(event.value.data)
  #       data_as_callback.call(me, event)
  #     }, boxed_data, nil)
  #     @box[event_id] = boxed_data
  #   end

  #   def bind_event(event : String, &callback : Lcui::EventCallback)
  #     bind_event(event, callback)
  #   end

  #   def unbind_event(event_id : LibC::Int)
  #     @box.delete(event_id)
  #   end

  #   def append_child(*widgets : Widget)
  #     widgets.each do |widget|
  #       LibLCUI.widget_append(@native, widget.internal)
  #       @children << widget
  #     end
  #   end

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
