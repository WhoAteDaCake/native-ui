require "./LibLCUI"

class Widget
  @@box: Pointer(Void)?
  @widget: LibLCUI::LcuiWidget

  def initialize(@id : String)
    @widget = LibLCUI.lcui_widget_get_by_id(@id)
  end

  def on_click(&callback : (LibLCUI::LcuiWidgetRec, LibLCUI::LcuiWidgetEventRec) ->)
    boxed_data = Box.box(callback)
    @@box = boxed_data
    LibLCUI.widget_bind_event(@widget, "click", ->(me, event, _data) {
      data_as_callback = Box(typeof(callback)).unbox(event.value.data)
      data_as_callback.call(me.value, event.value)
    }, boxed_data, nil)
  end

end

def main()

  LibLCUI.lcui_init()

  root = LibLCUI.lcui_widget_get_root()
  pack = LibLCUI.lcui_builder_load_file("./assets/helloworld.xml")
  LibLCUI.widget_append(root, pack)
  LibLCUI.widget_unwrap(pack)

  btn = Widget.new("btn")
  btn.on_click do | e, data |
    edit = LibLCUI.lcui_widget_get_by_id("edit")
    text = LibLCUI.lcui_widget_get_by_id("text-hellos")
    p! text.null?

    # buffer = Slice(LibLCUI::WcharT).new(256)
    # LibLCUI.text_edit_get_text_w(edit, 0, 255, buffer)
    # LibLCUI.text_view_set_text_w(text, buffer)
    
    # NOTE: how to read the string value
    # pointer = buffer.to_unsafe 
    # loop do
    #   string, pointer = String.from_utf16(pointer) # => "hi"
    #   p! string
    #   if string.size == 0
    #     break
    #   end
    # end
  end

  LibLCUI.lcui_main()
end

main()