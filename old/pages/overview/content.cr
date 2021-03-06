
Lcui.register_sass("
  .overview_page_content {
    background-color: rgba(1.0, 0, 0, 0.9);

    &__mail_container {
      display: inline-block;
      width: 100%;
    }
  }
")

class OverviewPageContent
  property container : Widget
  property mail : Mail
  @scrollbar : ScrollBar
  @messages : Array(MailPreview)
  @mail_container : Widget

  def initialize(auth, @container)
    @container.add_class("overview_page_content", "f-h")

    @mail_container = Widget.make
    @mail_container.add_class("overview_page_content__mail_container")

    @mail = Mail.new(auth)
    list = @mail.load_email_meta
    @messages = list.map { |d| MailPreview.new(d) }
    @messages.each do |m|
      m.mount_on(@mail_container)
    end

    @scrollbar = ScrollBar.new
    @scrollbar.bind_scroll(@mail_container)
    @container.append_child(@mail_container, @scrollbar)

    @mail_container.bind_event("click") do |w,e|
      w = Widget.new(e.value.target, indirect: true)
      id = w.get_attr("message_id")
      if id
        Router.push("/mail/#{id}")
      end
    end
  end

  def mount_on(parent)
    parent.append_child(@container)
  end
end