require "../lcui"

Lcui.register_css("
  .header {
    margin: 10px auto 10px auto;
    width: 250px;
    height: 32px;
    display: flex;
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
    @button = Button.new("Hello world")

    @button.on_click do | node, event |
      # p! event
    end
    @header.append_child(@input, @button)
  end

  def render(parent : Widget)
    parent.append_child(@header)
  end
end