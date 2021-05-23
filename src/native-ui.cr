require "./LibLCUI"

# # TODO: Write documentation for `Native.Ui`
# module Native.Ui
#   VERSION = "0.1.0"

#   # TODO: Put your code here
# end
def main()
  # pack = LibLCUI::LcuiWidgetRec.new
  # pack_p = pointerof(pack)
  # btn = LibLCUI::LcuiWidget.new

  LibLCUI.lcui_init()

  root = LibLCUI.lcui_widget_get_root()
  pack = LibLCUI.lcui_builder_load_file("./assets/helloworld.xml")
  p! pack

  LibLCUI.widget_append(root, pack)
  LibLCUI.widget_unwrap(pack)
  LibLCUI.lcui_main
end

main()