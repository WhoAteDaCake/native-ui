require "../lcui"

Lcui.register_sass("
  .header {
    margin: 10px auto 10px auto;
    width: 250px;
    height: 32px;
    display: flex;

    &__button {
      margin-left: 10px;
      width: 70px;
    }
  }
")

class Header
  @header : Widget
  @input : TextEdit
  @button : Button

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
  end

  def on_add()
    p! @input.get_value
  end

  def mount_on(parent : Widget)
    parent.append_child(@header)
  end
end