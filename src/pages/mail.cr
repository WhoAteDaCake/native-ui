require "./page"
require "../core/*"

Lcui.register_sass("
  $bg-color: #f5f5f5;

  .mail_page_content {
    display: flex;
    flex-direction: column;
    &__header {
      width: 100%;
      background-color: #f5f5f5;
      height: 30px;
      display: flex;
      align-items: center;
      padding: 0 10px 0 10px;
    }
    &__back_link {
      cursor: pointer;
      background-color: rgba(darken($bg-color, 10%), 0.99);
      width: 75px;
    }
  }
")

class MailPageContent
  def initialize(@container : Widget, @mail : Mail, @id : String)
    message = (Mail::Size | Mail::RawBody | Mail::Attachment).from_json(%({"size": 0}))
    p! message
    # message = @mail.message @id
    # puts message
    # File.write("output.json", message.to_json)
    @container.append_child(
      Widget.make(
        classes: ["mail_page_content__header"],
        children: [
          TextView.make(
            "<-- Go back",
            classes: ["mail_page_content__back_link"],
            events: {
              "click" => EventCallback.new do |w, e|
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
  property mail : Mail
  property content : MailPageContent | Nil

  def initialize(@mail : Mail)
    @container = Widget.make(
      classes: ["full-size", "mail_page_content"]
    )
  end

  def on_mount(params)
    content = @content
    if @content
      container.remove_children
    end 
    @content = MailPageContent.new(@container, @mail, params["id"])
  end
end