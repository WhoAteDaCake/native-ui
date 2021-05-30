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
    # p! event
    button.set_text("Govna")
  end
  root.append_child(button.widget)
  LibLCUI.lcui_main()
end

main()