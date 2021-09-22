module Lcui
  @@css : Array(String) = Array(String).new
  alias Event = LibLCUI::LcuiWidgetEvent
  alias EventCallback = (Widget, Event) ->

  alias UcharT = LibLCUI::UcharT
  alias Color = LibLCUI::LcuiArgb8888
  alias WindowPos = LibLCUI::LcuiRect2F

  def self.run(& : ->)
    LibLCUI.lcui_init
    Lcui.load_css

    root = yield

    LibLCUI.lcui_thread_create(out tid, ->(data : Void*) {
      LibLCUI.lcui_main
    }, nil)

    sleep(0.5)
    LibLCUI.surface_move(LibLCUI.lcui_display_get_surface_owner(root.native), 0, 300)

    LibLCUI.lcui_thread_join(tid, nil)
    LibLCUI.lcui_quit
  end

  def self.rgba(r : UcharT, g : UcharT, b : UcharT, a : UcharT)
    color = LibLCUI::LcuiArgb8888.new
    rgb = LibLCUI::LcuiArgb8888Field1.new
    rgb.red = r
    rgb.green = g
    rgb.blue = b
    rgb.alpha = a
    color.field_1 = rgb
    color
  end

  def self.rgb(r : UcharT, g : UcharT, b : UcharT)
    rgba(r, g, b, 255)
  end

  def self.register_css(css : String)
    @@css << css
  end

  def self.register_sass(sass : String)
    css = Sass.compile(sass)
    @@css << css
    css
  end

  def self.load_css
    full_css = @@css.join("\n")
    @@css.clear
    status = LibLCUI.lcui_load_css_string(full_css, nil)
    if status != 0
      raise "Failed to load CSS: #{status}"
    end
  end

  def self.load_css(css)
    status = LibLCUI.lcui_load_css_string(css, nil)
    if status != 0
      raise "Failed to load CSS: #{status}"
    end
  end

  def self.to_bool(value : UInt8)
    value != 0
  end
end
