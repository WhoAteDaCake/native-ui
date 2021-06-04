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
  @button : Button
  @cb : (Int16 -> )
  property id : Int16

  def initialize(text_raw : String, @id : Int16)
    text = TextView.new
    text.set_text(text_raw)
    text.set_color(TEXT_COLOR)
    
    button = Button.new("X")
    @button = button

    @container = Widget.new
    @container.add_class("entry_container")
    @container.append_child(text, button)
    @cb = ->(x : Int16) {}
  end

  def on_remove(&block : Int16 ->)
    @cb = block
    @button.on_click do |w,e|
      @cb.call(@id)
    end
  end

  def unmount_of(parent : Widget)
    parent.remove_child(@container)
    @container.remove_all_children
  end

  def mount_on(parent : Widget)
    parent.append_child(@container)
  end
end