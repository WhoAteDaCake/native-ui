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

Lcui.register_css("
  .root {
    height: 100%;
    width: 100%;
    display: flex;
    flex-direction: column;

    &__button {
      height: 20px
    }
  }
")


Lcui.run do
  root = Widget.root()
  root.add_class("root")

  window = Window.new(storage, root)
  window.sync_widget
  root.bind_event("resize", ->(w : LibLCUI::LcuiWidgetRec, e : LibLCUI::LcuiWidgetEventRec) {
    # p! e
    puts "resize"
  })

  root.bind_event("surface", ->(w : LibLCUI::LcuiWidgetRec, e : LibLCUI::LcuiWidgetEventRec) {
    puts "surface"
  })

  # page1 = TextView.new
  # page1.set_text("page1")
  header = Header.new
  page1 = Widget.new
  header.mount_on(page1) 


  page2 = TextView.new
  page2.set_text("page2")

  ctx = GLOBAL_ROUTER
  router = Router.new(ctx)
  router.routes["/"] = page1
  router.routes["/page2"] = page2
  
  button = Button.new("Change page")
  button.add_class("root__button")
  button.on_click do |w,e|
    changed =
      if ctx.state == "/"
        "/page2"
      else
        "/"
      end
    puts "Switching #{ctx.state} -> #{changed}"
    ctx.update changed
  end

  
  root.append_child(button)
  router.mount_on(root)
end