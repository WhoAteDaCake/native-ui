require "./page"

Lcui.register_sass("
  .mail_page_content {
    display: flex;
    flex-direction: column;
    &__header {
      width: 100%;
      background-color: rgb(245, 245, 245);
      height: 30px;
    }
  }
")

class MailPageContent
  def initialize(@container : Widget, @auth : Auth, @id : String)
    header = Widget.make
    header.add_class("mail_page_content__header")
    # TODO: create anchor tag
    link_back = TextView.make(text: "Go back")
    header.append_child(link_back)

    text = TextView.make(text: @id)
    @container.append_child(header, text)
  end
end

class MailPage
  include Page
  property container : Widget
  property url = "/mail/:id"
  #
  property auth : Auth
  property content : MailPageContent | Nil

  def initialize(@auth)
    @container = Widget.make
    @container.add_class("full-size", "mail_page_content")
  end

  def on_mount(params)
    content = @content
    if @content
      container.remove_children
    end 
    @content = MailPageContent.new(@container, @auth, params["id"])
    # text = TextView.make
    # text.set_text(params["id"])
    # @container.append_child(text)
  end
end