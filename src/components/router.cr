class Router
  property routes : Hash(String, Widget)
  property container : Widget
  property ctx : RouterContext
  @listener_id : RouterContext::Id
  @active_route : Widget?

  def initialize(@ctx : RouterContext)
    @listener_id = @ctx.listen ->on_change(String)
    @container = Widget.new
    @routes = Hash(String, Widget).new
  end

  def finalize()
    @ctx.unlisten(@listener_id)
  end

  def route()
    @ctx.state
  end
  
  def mount_on(widget : Widget)
    widget.append_child(@container)
    # Check for default route
    on_change route
  end

  def on_change(route : String)
    prev = @active_route
    pair = @routes.find {|k,v| k == route}
    if pair
      # Same child, skip action
      if ! (prev && pair[1].id == prev.id)
        # Have child from before
        if prev
          @container.unmount_child(prev)
        end
        @container.append_child(pair[1])
        @active_route = pair[1]
      end
    end
    nil
  end

end