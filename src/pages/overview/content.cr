class OverviewPageContent
  property container : Widget
  property mail : Mail

  def initialize(auth)
    @container = Widget.new
    @mail = Mail.new(auth)
  end

  def mount_on(parent)
    parent.append_child(@container)
  end
end