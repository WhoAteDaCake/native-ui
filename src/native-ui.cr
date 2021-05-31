require "./LibLCUI"
require "./widgets/*"
require "./components/*"
require "./lcui"

# Notes
# - LCUIWidget_NewPrototype -> Creates new widget [widget_prototype.c] (125)
# - LCUI_WidgetPrototypeRec_ -> [widget_base.h] (150)
# - LCUI_SettingsRec -> global settings [settings.c] (35)
# - LCUI_WidgetPrototypeModule -> where models are stored [widget_prototype.c] (38)
# - ParseResource -> Parses HTML code [builder.c] (95)
# - LCUIWidget_New -> Create widget [widget_base.c] (174)

Lcui.register_css("
  .root {
    height: 100%;
    width: 100%;
    display: flex;
  }
")

def main()
  LibLCUI.lcui_init()
  Lcui.load_css()

  root = Widget.root()
  root.resize(200, 200)
  root.add_class("root")

  header = Header.new
  header.mount_on(root)

  LibLCUI.lcui_main()
end

main()