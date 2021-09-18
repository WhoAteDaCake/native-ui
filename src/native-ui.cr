require "./lcui/*"

Lcui.run do
  root = Lcui::Widget.root
  pack = LibLCUI.lcui_builder_load_file("./assets/helloworld.xml")
  pack = Lcui::Widget.reuse(pack)
  root.append(pack)
  LibLCUI.widget_unwrap(pack.native)
end
