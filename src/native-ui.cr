require "./LibLCUI"
require "./widgets/*"
require "./context/**"
require "./components/*"
require "./utils/*"
require "./lcui"


require "./crymail/*"
require "./pages/*"


# Notes
# - LCUIWidget_NewPrototype -> Creates new widget [widget_prototype.c] (125)
# - LCUI_WidgetPrototypeRec_ -> [widget_base.h] (150)
# - LCUI_SettingsRec -> global settings [settings.c] (35)
# - LCUI_WidgetPrototypeModule -> where models are stored [widget_prototype.c] (38)
# - ParseResource -> Parses HTML code [builder.c] (95)
# - LCUIWidget_New -> Create widget [widget_base.c] (174)

Log.setup(:info, backend: Log::IOBackend.new(dispatcher: Log::DispatchMode::Direct))
Logger = Log.for("crymail", :info)
Logger.info { "Running at version: [#{Crymail::VERSION}]"}

storage = Storage.new("./data")
auth = Auth.new(storage)
auth.load_token

Lcui.register_css("
  .root {
    height: 100%;
    width: 100%;
  }
  .full-size {
    width: 100%;
    height: 100%;
  }
  .f-h {
    height: 100%;
  }
")

Lcui.run do
  root = Widget.root()
  root.add_class("full-size")

  window = Window.new(storage, root)
  pos = window.position
  window.sync_widget(pos)

  root.bind_event("destroy") do |w,e|
    window.update_position pos
  end

  root.bind_event("resize") do |w,e|
    width = LibLCUI.lcui_display_get_width
    height = LibLCUI.lcui_display_get_height
    pos.update_size(width, height)
  end

  overview_page = OverviewPage.new
  login_page = LoginPage.new

  ctx = GLOBAL_ROUTER
  router = Router::State.new(root)
  router.add "/", login_page
  router.add "/emails", overview_page

  ctx.listen do |action|
    action, route = action
    case action
      in Router::Action::Push
        router.push(route)
      in .replace?
        router.replace(route) 
    end
  end
  
  router.change_page("/", login_page, Hash(String, String).new)

  if ! auth.not_loaded
    overview_page.introduce_auth(auth)
    ctx.update ({Router::Action::Replace, "/emails"})
  end

  # TODO: should unbind 
  login_page.button.bind_event("click") do |w,e|
    auth.login
    overview_page.introduce_auth(auth)
    ctx.update ({Router::Action::Replace, "/emails"})
  end

  # router.mount_on(root)
end