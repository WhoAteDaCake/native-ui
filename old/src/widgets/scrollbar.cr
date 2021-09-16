class ScrollBar < Widget
  def initialize()
    super(LibLCUI.lcui_widget_new("scrollbar"))
  end

  def bind_scroll(widget : Widget)
    LibLCUI.scroll_bar_bind_target(@internal, widget.internal)
  end
end