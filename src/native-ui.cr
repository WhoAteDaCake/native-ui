require "./lcui"

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
    .append(
      hello = Lcui::TextView.make("Hello"),
      input = Lcui::TextEdit.make("Howdy"),
      Lcui::Button.make(
        "Hello",
        callbacks: Lcui::Events.handler.on("click") do |w, e|
          # hello.set_text("Howdy")
          input.sync_text
          hello.set_text(input.text)
          # puts input.text
        end
      )
    )

  LibLCUI.lcui_display_bind_event(2, ->(e : LibLCUI::LcuiEvent, args : Void*) {
    ref = Box(TmpRef).unbox(e.value.data)
    if !ref.called
      ref.called = true
      LibLCUI.surface_move(
        LibLCUI.lcui_display_get_surface_owner(ref.root.native),
        0,
        450
      )
    end
  }, nil, Box.box(TmpRef.new(root)), nil)
end
