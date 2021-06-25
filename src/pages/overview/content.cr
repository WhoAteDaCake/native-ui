
Lcui.register_sass("
  .overview_page_content {
    height: 300px;
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

  # - container
  #   - mail_container
  #     - messages
  #   - scrollbar
  def initialize(auth)
    @container = Widget.new
    @container.add_class("overview_page_content")

    @mail_container = Widget.new
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
  end

  def mount_on(parent)
    parent.append_child(@container)
  end
end