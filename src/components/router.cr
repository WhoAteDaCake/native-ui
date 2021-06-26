require "radix"

module Router
  class State
    property tree : Radix::Tree(Page)
    property root : Widget
    property active : Page | Nil
    property history : Array(String)
    
    def initialize(@root : Widget)
      @tree = Radix::Tree(Page).new
      @history = Array(String).new
    end

    def initialize(root : Widget, default_page : Page)
      initialize(root)
      @active = default_page
      root.append_child(default_page.container)
    end
  
    def change_page(route : String, page : Page, params : Hash(String, String))
      active = @active
      if active
        @root.unmount_child(active.container)
      end
      @active = page
      @root.append_child(page.container)
      page.on_mount(params)
    end

    def push(route : String)
      result = tree.find route
      if result.found?
        change_page(route, result.payload, result.params)
        @history << route
      end
    end

    def replace(route : String)
      result = tree.find route
      if result.found?
        change_page(route, result.payload, result.params)
        # Should never really happen, let's just validate to be safe
        if @history.size > 0
          @history[@history.size - 1] = route
        end
      end
    end

    def add(page : Page)
      @tree.add(page.url, page)
    end

  end
end