class ScrollBar < Widget
  def initialize()
    super("scrollbar")
  end

  def bind_scroll(widget : Widget)
    LibLCUI.scroll_bar_bind_target(@internal, widget.internal)
  end
end