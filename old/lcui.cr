require "sass"
require "./LibLCUI.cr"

# Changes in LibLCUI:
# type LcuiColor = LcuiArgb8888
#   -> alias LcuiColor = LcuiArgb8888
# alias WCharT = Int32
#   -> alias WCharT = UInt16
# NEW: fun rgb = RGB(red : UcharT, green : UcharT, blue : UcharT): LcuiColor

# LINKS
# @[Link(ldflags: "`pkg-config --cflags --libs x11 xcb libpng fontconfig`")]
# # Rest
# @[Link(ldflags: "-L#{__DIR__}/../LCUI/src/.libs")]
# @[Link(ldflags: "-lLCUI")]
# @[Link(ldflags: "-I#{__DIR__}/../LCUI/include")]
# @[Link(ldflags: "-I#{__DIR__}/../LCUI/")]

module Lcui
  @@css : Array(String) = Array(String).new
  alias Widget = LibLCUI::LcuiWidget
  alias Event = LibLCUI::LcuiWidgetEvent
  alias EventCallback = (Widget, Event) ->

  alias UcharT = LibLCUI::UcharT
  alias Color = LibLCUI::LcuiArgb8888
  alias WindowPos = LibLCUI::LcuiRect2F

  def self.run(& : -> )
    LibLCUI.lcui_init()
    Lcui.load_css()
  
    yield
  
    LibLCUI.lcui_thread_create(out tid, ->(data : Void*) {
      LibLCUI.lcui_main
    }, nil)

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

  def self.load_css()
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