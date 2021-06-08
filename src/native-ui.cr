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

Log.setup(:debug, backend: Log::IOBackend.new(dispatcher: Log::DispatchMode::Direct))
Logger = Log.for("crymail", :debug)
Logger.info { "Running at version: [#{Crymail::VERSION}]"}

storage = Storage.new("./data")
auth = Auth.new(storage)
auth.load_token

Lcui.register_css("
  .root {
    height: 100%;
    width: 100%;
  }
")


Lcui.run do
  root = Widget.root()
  root.add_class("root")

  window = Window.new(storage, root)
  pos = window.position
  window.sync_widget(pos)

  root.bind_event("destroy", ->(w : LibLCUI::LcuiWidgetRec, e : LibLCUI::LcuiWidgetEventRec) {
    window.update_position pos
  })

  root.bind_event("resize", ->(w : LibLCUI::LcuiWidgetRec, e : LibLCUI::LcuiWidgetEventRec) {
    width = LibLCUI.lcui_display_get_width
    height = LibLCUI.lcui_display_get_height
    pos.update_size(width, height)
  })


  overview_page = OverviewPage.new
  login_page = LoginPage.new

  ctx = GLOBAL_ROUTER
  router = Router.new(ctx)
  router.routes["/"] = login_page.container
  router.routes["/emails"] = overview_page.container

  if ! auth.not_loaded
    overview_page.introduce_auth(auth)
    ctx.update "/emails"
  end

  # TODO: should unbind 
  login_page.button.bind_event("click", ->(w : LibLCUI::LcuiWidgetRec, e : LibLCUI::LcuiWidgetEventRec) {
    auth.login
    overview_page.introduce_auth(auth)
    ctx.update "/emails"
  })

  router.mount_on(root)
end