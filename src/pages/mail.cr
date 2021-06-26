require "./page"
require "../core/*"

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
    @container.append_child(
      Widget.make(
        classes: ["mail_page_content__header"],
        children: [
          TextView.make(
            "Go back",
            events: {
              "click" => Callback.new do |w, e|
                Router.pop
              end
            }
          ),
        ]
      ),
      TextView.make(@id)
    )
  end
end

class MailPage
  include Page
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
  end
end