require "../LibLCUI.cr"
require "../lcui.cr"

class Widget
  alias EventHash = Hash(LibC::Int, Pointer(Void))

  property internal : LibLCUI::LcuiWidget
  @box: EventHash
  @children : Array(Widget)

   def self.root()
    Widget.new(LibLCUI.lcui_widget_get_root())
  end

  def initialize(internal : LibLCUI::LcuiWidget)
    @internal = internal
    @box = EventHash.new
    @children = Array(Widget).new
  end

  def initialize(proto_name : String)
    initialize(LibLCUI.lcui_widget_new(proto_name))
  end

  def initialize()
    initialize("widget")
  end

  def finalize
    remove_all_children
    @box.each do |key, value|
      unbind_event(key)
    end
    LibLCUI.widget_destroy(@internal)
  end

  def set_text(text : String)
    LibLCUI.text_view_set_text(@internal, text)
  end

  def bind_event(event : String, callback : Lcui::EventCallback)
    boxed_data = Box.box(callback)
    event_id = LibLCUI.widget_bind_event(internal, event, ->(me, event, _data) {
      data_as_callback = Box(typeof(callback)).unbox(event.value.data)
      data_as_callback.call(me.value, event.value)
    }, boxed_data, nil)
    @box[event_id] = boxed_data
  end

  def unbind_event(event_id : LibC::Int)
    LibLCUI.lcui_unbind_event(event_id)
    @box.delete(event_id)
  end

  def append_child(*widgets : Widget)
    widgets.each do |widget|
      LibLCUI.widget_append(@internal, widget.internal)
      @children << widget
    end
  end

  def remove_child(widget : Widget)
    LibLCUI.widget_unlink(widget.internal)
    @children.select! do | child |
      child.value.hash != widget.value.hash
    end
  end

  def remove_all_children()
    @children.each do | child |
      LibLCUI.widget_unlink(child.internal)
    end
    @children.clear
  end

  def add_class(cname : String)
    LibLCUI.widget_add_class(@internal, cname)
  end

  def remove_class(cname : String)
    LibLCUI.remove_class(@internal, cname)
  end

  def resize(width : LibC::Float, height : LibC::Float)
    LibLCUI.widget_resize(@internal, width, height)
  end

end