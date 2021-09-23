require "./widgets"

module Lcui
  abstract class Page
    property url : String
    property root : Widget
    property container : Widget

    def initialize(@url : String, @root : Widget, @container : Widget)
    end

    def on_mount(params : Hash(String, String))
    end

    def on_unmount
      @root.unmount(@container)
    end
  end
end
