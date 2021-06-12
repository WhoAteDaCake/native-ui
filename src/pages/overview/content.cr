
Lcui.register_sass("
  .overview_page_content {
    display: flex;
    flex-direction: column;
    &__mail_container {
      min-height: 100%;
      width: 100%;
      flex: 1 1 auto;
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

    @scrollbar = ScrollBar.new
    @scrollbar.bind_scroll(@mail_container)
    @container.append_child(@mail_container, @scrollbar)
    
    @mail = Mail.new(auth)
    list = @mail.load_email_meta
    @messages = list.map { |d| MailPreview.new(d) }
    @messages.each do |m|
      m.mount_on(@mail_container)
    end
  end

  def mount_on(parent)
    parent.append_child(@container)
  end
end