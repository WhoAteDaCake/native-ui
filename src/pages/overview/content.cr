
Lcui.register_sass("
  .overview_page_content {
    display: flex;
    flex-direction: column;
    &__row {
      border: 1px solid #fff;
      margin: 10px 0 0 0;
    }
  }
")

class OverviewPageContent
  property container : Widget
  property mail : Mail
  @messages : Array(MailPreview)

  def initialize(auth)
    @container = Widget.new
    @container.add_class("overview_page_content")

    @mail = Mail.new(auth)
    list = @mail.load_email_meta
    @messages = list.map { |d| MailPreview.new(d, "overview_page_content__row") }
    @messages.each do |m|
      m.mount_on(@container)
    end
  end

  def mount_on(parent)
    parent.append_child(@container)
  end
end