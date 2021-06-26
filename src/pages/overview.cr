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
    @content = nil
  end

  def introduce_auth(auth)
    content = OverviewPageContent.new(auth, @container)
    @content = content
  end
end