require "../lcui"
require "./entry"

Lcui.register_sass("
  .container {
    display: flex;
    flex-direction: column;
    margin: 10px auto 10px auto;
    width: 250px;
  }

  .header {
    height: 32px;
    display: flex;

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
  @items : Array(Entry)
  @container: Widget

  def initialize()
    @header = Widget.new
    @header.add_class("header")

    @input = TextEdit.new
    @button = Button.new("Create")
    @button.add_class("header__button")

    @button.on_click do |w, e|
      on_add
    end
    @header.append_child(@input, @button)

    @content = Widget.new
    @content.add_class("content")
    @items = Array(Entry).new

    @container = Widget.new
    @container.append_child(@header, @content)
    @container.add_class("container")

  end

  def on_add()
    text = @input.value
    if text.size != 0
      entry = Entry.new(text)
      entry.mount_on(@container)
    end
  end

  def mount_on(parent : Widget)
    parent.append_child(@container)
  end
end