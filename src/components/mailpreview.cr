class MailPreview
  @container : Widget
  @text: TextView

  def initialize(data : Mail::MessageMeta, class_name : String)
    @container = Widget.new
    @container.add_class(class_name)
    @text = TextView.new
    @text.set_text(data.snippet)
    @container.append_child(@text)
  end

  def mount_on(parent)
    parent.append_child(@container)
  end
end