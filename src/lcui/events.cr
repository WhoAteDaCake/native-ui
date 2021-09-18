module Lcui
  module Events
    # TODO: start supporting more typed events in the future
    alias NativeEvent = LibLCUI::LcuiWidgetEvent
    alias NativeEventCallback = (Widget, NativeEvent) ->

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

      def register(widget : Widget)
        @register.each do |event, callback|
          boxed_data = Box.box(callback)
          event_id = LibLCUI.widget_bind_event(internal, event, ->(me, event, _data) {
            data_as_callback = Box(typeof(callback)).unbox(event.value.data)
            data_as_callback.call(me, event)
          }, boxed_data, nil)
          @box[event_id] = boxed_data
        end
      end
    end
  end
end
