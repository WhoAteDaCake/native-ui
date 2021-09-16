
module Router
  @@ctx = Router::RouterContext.new ({Router::Action::Push, "/"})

  enum Action
    Push
    Replace
    Pop
  end
  alias RouterContext = Context({Action, String})

  def self.push(route)
    @@ctx.update({Router::Action::Push, route})
  end

  def self.replace(route)
    @@ctx.update({Router::Action::Replace, route})
  end

  def self.pop()
    @@ctx.update({Router::Action::Pop, ""})
  end

  def self.listen(&action : {Action, String} ->)
    @@ctx.listen action
  end
end