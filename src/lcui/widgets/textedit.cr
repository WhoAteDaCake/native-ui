require "./textview"

module Lcui
  class TextEdit < TextView
    @buffer_size : Int16 = 512

    def self.make(text : String, **opts)
      self.new(text, Props.new("textedit", **opts))
    end

    def set_text(text)
      @text = text
      LibLCUI.text_edit_set_text(@native, @text)
    end

    def sync_text
      buffer = Slice(LibLCUI::WcharT).new(@buffer_size)
      LibLCUI.text_edit_get_text_w(@native, 0, @buffer_size - 1, buffer)

      pointer = buffer.to_unsafe
      output = ""
      loop do
        string, pointer = String.from_utf16(pointer) # => "hi"
        if string.size == 0
          break
        end
        output += string
      end
      @text = output
    end
  end
end
