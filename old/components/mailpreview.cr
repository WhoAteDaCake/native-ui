Lcui.register_sass("
  .mail_preview {
    background-color: #F2E9E4;
    padding: 2px 2px 2px 2px;
    border: 1px solid #000;
  }
")

class MailPreview
  @container : Widget
  @text: TextView

  def initialize(data : Mail::MessageMeta)
    from = data.payload.headers.find { |h| h.name == "From"}
    if from.nil?
      raise "Email with no FROM field found, unexpected"
    end
    name = from.value.split("<")[0]
    @container = Widget.make
    @container.add_class("mail_preview")
    # TODO: base on width of the screen ?
    full_text = "#{name}  #{data.snippet[0,50]}"
    @text = TextView.make(full_text)
    @container.append_child(@text)

    # @container.set_attr("list_id", @id)
    @text.set_attr("message_id", data.id)
  end

  def mount_on(parent)
    parent.append_child(@container)
  end
end