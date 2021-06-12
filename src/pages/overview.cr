require "./overview/*"
require "../lcui"


class OverviewPage
  property container : Widget
  property content : OverviewPageContent | Nil 
  
  def initialize()
    @container = Widget.new
    @container.add_class("fc")
    @content = nil
  end

  def introduce_auth(auth)
    content = OverviewPageContent.new(auth)
    content.mount_on(@container)
    @content = content
  end
end