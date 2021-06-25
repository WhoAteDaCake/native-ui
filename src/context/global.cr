
module Router
  enum Action
    Push
    Replace
  end
  alias RouterContext = Context({Action, String})
end

GLOBAL_ROUTER = Router::RouterContext.new ({Router::Action::Push, "/"})