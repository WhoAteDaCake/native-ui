require "../LibLCUI.cr"
require "../lcui.cr"

class Widget
  @@id : Int64 = 0
  alias EventHash = Hash(LibC::Int, Pointer(Void))

  property internal : LibLCUI::LcuiWidget
  property id : Int64
  @box: EventHash
  @children : Array(Widget)
  @cleared : Bool = false
  # if we passed already used pointer to get api access
  @indirect : Bool = false
  
  def self.root()
    Widget.new(LibLCUI.lcui_widget_get_root())
  end

  def initialize(
    internal : LibLCUI::LcuiWidget,
    classes : Array(String) | Nil = nil,
    children : Array(Widget) | Nil = nil,
    indirect : Bool = false,
    events : Hash(String, Lcui::EventCallback | Callback) | Nil = nil,
  )
    @internal = internal
    @box = EventHash.new
    @children = Array(Widget).new
    @id = @@id
    @@id += 1
    # Set properties
    @indirect = indirect
    if children
      children.each { |c| append_child c }
    end
    if classes
      classes.each { |c| add_class c }
    end
    if events
      events.each do |k, v|
        if v.is_a?(Callback)
          bind_event(k, v.cb)
        else
          bind_event(k, v)
        end
      end
    end 
  end

  def self.make_proto(proto_name : String, **opts)
    Widget.new(LibLCUI.lcui_widget_new(proto_name), **opts)
  end

  def self.make(**opts)
    Widget.make_proto("widget", **opts)
  end

  def ptr()
    @internal
  end

  def finalize
    if ! @indirect
      destroy
    end
  end

  def destroy
    return if @cleared
    @cleared = true
    @children.clear
    @box.clear
    LibLCUI.widget_destroy(@internal)
  end

  def bind_event(event : String, callback : Lcui::EventCallback)
    boxed_data = Box.box(callback)
    event_id = LibLCUI.widget_bind_event(internal, event, ->(me, event, _data) {
      data_as_callback = Box(typeof(callback)).unbox(event.value.data)
      data_as_callback.call(me, event)
    }, boxed_data, nil)
    @box[event_id] = boxed_data
  end

  def bind_event(event : String, &callback : Lcui::EventCallback)
    bind_event(event, callback)
  end

  def unbind_event(event_id : LibC::Int)
    @box.delete(event_id)
  end

  def append_child(*widgets : Widget)
    widgets.each do |widget|
      LibLCUI.widget_append(@internal, widget.internal)
      @children << widget
    end
  end

  def unmount_child(widget : Widget)
    @children.select! do | child |
      child.hash != widget.hash
    end
    LibLCUI.widget_unlink(widget.internal)
  end

  def remove_children()
    LibLCUI.widget_destroy_children(@internal)
  end

  def add_class(*cnames : String)
    cnames.each { |c|  LibLCUI.widget_add_class(@internal, c)}
  end

  def has_class(cname : String)
    result = LibLCUI.widget_has_class(@internal, cname)
    Lcui.to_bool result
  end

  def remove_class(cname : String)
    LibLCUI.remove_class(@internal, cname)
  end

  def resize(width : LibC::Float, height : LibC::Float)
    LibLCUI.widget_resize(@internal, width, height)
  end

  def move(x : LibC::Float, y : LibC::Float)
    LibLCUI.widget_resize(@internal, x, y)
  end

  def set_attr(name : String, value : String)
    LibLCUI.widget_set_attribute(@internal, name, value)
  end

  def get_attr(name : String)
    attr = LibLCUI.widget_get_attribute(@internal, name)
    if attr.null?
      nil
    else
      String.new(attr)
    end
  end
end