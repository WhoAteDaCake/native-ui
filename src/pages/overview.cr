require "./page"
require "./overview/*"
require "../lcui"


class OverviewPage
  include Page
  property container : Widget
  property url = "/overview"
  property content : OverviewPageContent | Nil 

  
  def initialize()
    @container = Widget.new
    @container.add_class("full-size")
    @content = nil
  end

  def introduce_auth(auth)
    content = OverviewPageContent.new(auth)
    content.mount_on(@container)
    @content = content
  end
end