require "./lcui"
require "./pages"

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

  router = Lcui::Router::Instance.new(root)
  login = Pages::Login.new(root)
  router.add(login)
  router.replace("/login")
  # router.sea

  Lcui::Router::Global.listen do |action|
    action, route = action
    case action
    in Lcui::Router::Global::Action::Push
      router.push(route)
    in .replace?
      router.replace(route)
    in .pop?
      router.pop
    end
  end
  # TEMPORARY TOOL to move sapp to the side of the screen
  #
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
