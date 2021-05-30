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

def main()
  LibLCUI.lcui_init()
  LibLCUI.lcui_load_css_file("./assets/styles.css")

  root = Widget.root()
  root.add_class("item")

  button = Button.new("Hello world")
  button.add_class("item")

  button.on_click do | node, event |
    # p! event
    button.set_text("Govna")
  end

  root.append_child(button)
  LibLCUI.lcui_main()
end

main()