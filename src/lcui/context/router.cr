require "radix"
require "./context"

module Lcui
  module Router
    module Global
      enum Action
        Push
        Replace
        Pop
      end
      alias RouterContext = Context({Action, String})
      @@ctx = RouterContext.new ({Action::Push, "/"})

      def self.push(route)
        @@ctx.update({Action::Push, route})
      end

      def self.replace(route)
        @@ctx.update({Action::Replace, route})
      end

      def self.pop
        @@ctx.update({Action::Pop, ""})
      end

      def self.listen(&action : {Action, String} ->)
        @@ctx.listen action
      end
    end

    class Instance
      property tree : Radix::Tree(Page)
      property root : Widget
      property active : Page | Nil
      property history : Array(String)

      def initialize(@root : Widget)
        @tree = Radix::Tree(Page).new
        @history = Array(String).new
      end

      def load_default(default_page : Page)
        @active = default_page
        @history << default_page.url
        @root.append_child(default_page.container)
      end

      def change_page(route : String, page : Page, params : Hash(String, String))
        @active.try { |page| page.on_unmount }
        @active = page
        @root.append(page.container)
        page.on_mount(params)
      end

      def push(route : String)
        result = tree.find route
        if result.found?
          change_page(route, result.payload, result.params)
          @history << route
        end
      end

      def replace(route : String, swap_history = true)
        result = tree.find route
        if result.found?
          change_page(route, result.payload, result.params)
          # Should never really happen, let's just validate to be safe
          if swap_history && @history.size > 0
            @history[@history.size - 1] = route
          end
        end
      end

      def pop
        if @history.size > 0
          @history.pop
          replace(@history.last, false)
        end
      end

      def add(*pages : Page)
        pages.each { |p| @tree.add(p.url, p) }
      end
    end
  end
end
