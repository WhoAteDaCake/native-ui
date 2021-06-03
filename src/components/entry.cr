require "../lcui"
require "../widgets/*"

TEXT_COLOR = Lcui.rgb(255, 0, 0)

Lcui.register_sass("
  .entry {
    &_container {
      display: flex;
      justify-content: space-between;
    }
  }
")

class Entry
  @container : Widget

  def initialize(text_raw : String)
    text = TextView.new
    text.set_text(text_raw)
    text.set_color(TEXT_COLOR)
    
    button = Button.new("X")
    @container = Widget.new
    @container.add_class("entry_container")
    @container.append_child(text, button)
  end

  def mount_on(parent : Widget)
    parent.append_child(@container)
  end
end