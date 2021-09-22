require "./widgets/**"

module Lcui
  module Events
    # TODO: start supporting more typed events in the future
    alias NativeEvent = LibLCUI::LcuiWidgetEvent
    alias NativeEventCallback = (Widget, NativeEvent) ->

    def self.handler
      Handler.new
    end

    class Handler
      # Used for storing event callbacks to avoid GC
      # needs further investigation
      @box = Hash(LibC::Int, Pointer(Void)).new
      @register = Hash(String, NativeEventCallback).new

      def initialize
      end

      # TODO: warn on duplicate events
      def on(event_name : String, &block : NativeEventCallback)
        @register[event_name] = block
        self
      end

      def bind(widget : Widget)
        @register.each do |event, callback|
          boxed_data = Box.box({widget, callback})
          event_id = LibLCUI.widget_bind_event(widget.native, event, ->(native, event, _data) {
            me, cb = Box(Tuple(Widget, NativeEventCallback)).unbox(event.value.data)
            cb.call(me, event)
          }, boxed_data, nil)
          @box[event_id] = boxed_data
        end
      end
    end
  end
end
