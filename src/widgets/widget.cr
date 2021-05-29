require "../LibLCUI.cr"
require "../lcui.cr"

class Widget
  property internal : LibLCUI::LcuiWidget
  @box: Hash(String, Pointer(Void))

  def initialize(internal : LibLCUI::LcuiWidget)
    @internal = internal
    @box = Hash(String, Pointer(Void)).new
  end

  def initialize(proto_name : String)
    @internal = LibLCUI.lcui_widget_new(proto_name)
    @box = Hash(String, Pointer(Void)).new
  end

  def finalize
    LibLCUI.widget_destroy(@internal)
  end

  def set_text(text : String)
    LibLCUI.text_view_set_text(@internal, text)
  end

  def bind_event(event : String, callback : Lcui::EventCallback)
    boxed_data = Box.box(callback)
    @box[event] = boxed_data
    LibLCUI.widget_bind_event(internal, event, ->(me, event, _data) {
      data_as_callback = Box(typeof(callback)).unbox(event.value.data)
      # Note: could pass @node.value ?
      data_as_callback.call(me.value, event.value)
    }, boxed_data, nil)
  end

  def append(widget : Widget)
    LibLCUI.widget_append(@internal, widget.internal)
  end

  def self.root()
    Widget.new(LibLCUI.lcui_widget_get_root())
  end
end