require "./lcui/*"

class TmpRef
  property root : Lcui::Widget
  property called : Bool = false

  def initialize(@root)
  end
end

Lcui.run do
  root = Lcui::Widget.root
  root.style("width", "100px")
    .style("height", "200px")

  pack = LibLCUI.lcui_builder_load_file("./assets/helloworld.xml")
  pack = Lcui::Widget.reuse(pack)
  root.append(pack)
  LibLCUI.widget_unwrap(pack.native)

  root.append(
    Lcui::TextView.make("Hello"),
    Lcui::Button.make("Hello",
      callbacks: Lcui::Events.handler.on("click") do |w, e|
        puts "clicked"
      end
    )
  )

  rf = TmpRef.new(root)
  boxed_data = Box.box(rf)

  # TMP
  LibLCUI.lcui_display_bind_event(2, ->(e : LibLCUI::LcuiEvent, args : Void*) {
    ref = Box(TmpRef).unbox(e.value.data)
    if !ref.called
      ref.called = true
      LibLCUI.surface_move(LibLCUI.lcui_display_get_surface_owner(ref.root.native), 0, 300)
    end
  }, nil, boxed_data, nil)
end
