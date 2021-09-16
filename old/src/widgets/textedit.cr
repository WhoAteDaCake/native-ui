require "./widget"

class TextEdit < Widget
  @buffer_size : Int16 = 512

  def initialize(**opts) 
    super(LibLCUI.lcui_widget_new("textedit"), **opts)
  end

  def value()
    buffer = Slice(LibLCUI::WcharT).new(@buffer_size)
    LibLCUI.text_edit_get_text_w(@internal, 0, @buffer_size - 1, buffer)
    
    pointer = buffer.to_unsafe
    output = ""
    loop do
      string, pointer = String.from_utf16(pointer) # => "hi"
      if string.size == 0
        break
      end
      output += string
    end
    output
  end
end