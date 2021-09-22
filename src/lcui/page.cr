require "./widgets"

module Lcui
  module Page
    property url : String
    property root : Widget
    property container : Widget

    def on_mount(params : Hash(String, String))
    end

    def unmount
      @root.unmount(@container)
    end
  end
end
