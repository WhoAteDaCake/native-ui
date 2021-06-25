require "radix"

module Router
  class State
    property tree : Radix::Tree(Page)
    property root : Widget
    property active : Page | Nil
    property history : Array(String)
    
    delegate add, to: @tree

    def initialize(@root : Widget)
      @tree = Radix::Tree(Page).new
      @history = Array(String).new
    end

    def change_page(route : String, page : Page, params : Hash(String, String), with_history = true)
      active = @active
      if active
        @root.unmount_child(active.container)
      end
      if with_history
        @history << route
      end
      @active = page
      @root.append_child(page.container)
      page.on_mount(params)
    end

    def push(route : String)
      result = tree.find route
      if result.found?
        change_page(route, result.payload, result.params, true)
      end
    end

    def replace(route : String)
      result = tree.find route
      if result.found?
        change_page(route, result.payload, result.params, false)
      end
    end
  end
end