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

  def initialize(text_raw : String)
    text = TextView.new
    text.set_text(text_raw)
    text.set_color(TEXT_COLOR)
    
    button = Button.new("X")
    @button = button

    @container = Widget.new
    @container.add_class("entry_container")
    @container.append_child(text, button)
  end

  def id()
    @container.id
  end

  def on_remove(block : Int64 ->)
    @button.on_click do |w,e|
      block.call(id)
    end
  end

  def unmount_of(parent : Widget)
    # parent.unmount_child(@container)
    @container.destroy
  end

  def mount_on(parent : Widget)
    parent.append_child(@container)
  end
end