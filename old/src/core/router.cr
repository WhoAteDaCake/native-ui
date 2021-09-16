require "radix"

module Router
  class Sync
    @storage : Storage
    delegate exec, to: @storage.conn
    delegate query, to: @storage.conn

    def initialize(@storage)
    end

    def setup()
      exec "
        create table if not exists router_history (
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          route TEXT NOT NULL
        );
      "
    end

    def retrieve()
      results = [] of String
      query "select route from router_history" do |rs|
        rs.each do
          results << rs.read(String)
        end
      end
      results
    end

    def append(route : String)
      exec "insert into router_history (route) values (?)", route
    end

    def replace_last(route : String)
      exec "
        update router_history
        set route = ?
        where id = (SELECT MAX(id) FROM router_history)
      ", route
    end

    def pop()
      exec "DELETE FROM router_history WHERE id = (SELECT MAX(id) FROM router_history);"
    end
  end

  class State
    property tree : Radix::Tree(Page)
    property root : Widget
    property active : Page | Nil
    property history : Array(String)
    @sync : Sync
    
    def initialize(@root : Widget, @sync : Sync)
      @tree = Radix::Tree(Page).new
      @history = Array(String).new
    end

    def load_default(default_page : Page)
      @active = default_page
      @history << default_page.url
      @root.append_child(default_page.container)
      # 
      @sync.append(default_page.url)
    end

    # Returns true if history was loaded
    def load_from_db()
      @history = @sync.retrieve
      if @history.size > 0
        # Set last route as active
        route = @history.last
        result = tree.find route
        if result.found?
          change_page(route, result.payload, result.params)
        end
        return true
      end
      false
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
        @sync.append(route)
      end
    end

    def replace(route : String, swap_history = true)
      result = tree.find route
      if result.found?
        change_page(route, result.payload, result.params)
        # Should never really happen, let's just validate to be safe
        if swap_history && @history.size > 0
          @history[@history.size - 1] = route
          @sync.replace_last(route)
        end
      end
    end

    def pop()
      if @history.size > 0
        @history.pop
        @sync.pop
        replace(@history.last, false)
      end
    end

    def add(*pages : Page)
      pages.each { |p| @tree.add(p.url, p) }
    end

  end
end