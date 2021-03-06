require "../lcui"
require "./entry"

Lcui.register_sass("
  .header {
    height: 32px;
    display: flex;

    &__container {
      display: flex;
      margin: 10px auto 10px auto;
      flex-direction: column;
      width: 250px;
    }

    &__button {
      margin-left: 10px;
      width: 70px;
    }
  }
  .content {
    margin-top: 10px;
    // Sass seems to have isuses with this
    // background-color: rgba(0, 0, 255, .99);
  }
")

class Header
  @header : Widget
  @input : TextEdit
  @button : Button
  @content : Widget
  property items : Array(Entry)
  @container: Widget
  @idx : Int16 = 0

  def initialize()
    @header = Widget.make
    @header.add_class("header")

    @input = TextEdit.new
    @button = Button.new("Create")
    @button.add_class("header__button")

    @button.on_click do |w, e|
      on_add @input.value
    end
    @header.append_child(@input, @button)

    @content = Widget.make
    @content.add_class("content")
    @items = Array(Entry).new

    @container = Widget.make
    @container.append_child(@header, @content)
    @container.add_class("header__container")
  end

  def on_remove(id : Int64)
    items, found = @items.reduce({[] of Entry, nil}) do |acc,e|
      ls, f = acc
      if e.id == id
        {ls, e}
      else
        ls << e
        {ls, f}
      end
    end
    @items = items
    if found
      found.unmount_of(@container)
    end
  end

  def on_add(text : String)
    if text.size != 0
      entry = Entry.new(text)
      entry.on_remove ->on_remove(Int64)
      entry.mount_on(@container)
      @items << entry
    end
  end

  def mount_on(parent : Widget)
    parent.append_child(@container)
  end
end