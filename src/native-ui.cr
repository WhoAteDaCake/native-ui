require "./lcui/*"

Lcui.run do
  root = Lcui::Widget.root
  root.style("width", "100px")
    .style("height", "200px")

  pack = LibLCUI.lcui_builder_load_file("./assets/helloworld.xml")
  pack = Lcui::Widget.reuse(pack)
  root.append(pack)
  LibLCUI.widget_unwrap(pack.native)
  root
end
