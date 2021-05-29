require "./LibLCUI"
require "./widgets/*"
require "./lcui"

# Notes
# - LCUIWidget_NewPrototype -> Creates new widget [widget_prototype.c] (125)
# - LCUI_WidgetPrototypeRec_ -> [widget_base.h] (150)
# - LCUI_SettingsRec -> global settings [settings.c] (35)
# - LCUI_WidgetPrototypeModule -> where models are stored [widget_prototype.c] (38)
# - ParseResource -> Parses HTML code [builder.c] (95)
# - LCUIWidget_New -> Create widget [widget_base.c] (174)

# Notes:
# rather than loading from HTML
# Create nodes manually ?
def main()
  LibLCUI.lcui_init()

  root = Widget.root()
  button = Button.new("Hello world")
  button.on_click do | node, event |
    p! event
  end
  root.append(button.widget)
  
  # pack = LibLCUI.lcui_builder_load_file("./assets/helloworld.xml")
  # LibLCUI.widget_append(root, pack)
  # LibLCUI.widget_unwrap(pack)

  # btn = Widget.new("btn")
  # btn.on_click do | e, data |
  #   edit = LibLCUI.lcui_widget_get_by_id("edit")
  #   text = LibLCUI.lcui_widget_get_by_id("text-hellos")
  #   p! text.null?

  #   # buffer = Slice(LibLCUI::WcharT).new(256)
  #   # LibLCUI.text_edit_get_text_w(edit, 0, 255, buffer)
  #   # LibLCUI.text_view_set_text_w(text, buffer)
    
  #   # NOTE: how to read the string value
  #   # pointer = buffer.to_unsafe 
  #   # loop do
  #   #   string, pointer = String.from_utf16(pointer) # => "hi"
  #   #   p! string
  #   #   if string.size == 0
  #   #     break
  #   #   end
  #   # end
  # end

  LibLCUI.lcui_main()
end

main()