require "./lcui/*"

Lcui.run do
  root = Lcui::Widget.root
  pack = LibLCUI.lcui_builder_load_file("./assets/helloworld.xml")
  LibLCUI.widget_append(root.ptr, pack)
  LibLCUI.widget_unwrap(pack)
end
