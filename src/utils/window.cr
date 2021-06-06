require "log"
require "../crymail/storage"

class Window
  Logger = Log.for("window", :debug)

  struct Position
    property x, y, width, height

    def initialize(
      @x : LibC::Float,
      @y : LibC::Float,
      @width : LibC::Float,
      @height : LibC::Float
    )
    end
  end


  @storage : Storage
  @root : Widget

  def initialize(@storage : Storage, @root : Widget)
    if @storage.should_init
      init (Position.new(200, 200, 0, 0))
    end
  end

  def init(pos)
    Logger.info { "Initialising size table" }
    @storage.conn.exec "
      create table sizes (x float, y float, width float, height float)"
    update_position pos
  end

  def update_position(pos : Position)
    Logger.debug { "Updating position #{pos}" }

    args = [] of DB::Any
    args << pos.x
    args << pos.y
    args << pos.width
    args << pos.height
    @storage.conn.exec "delete from sizes;"
    @storage.conn.exec "
      insert into sizes (x, y, width, height)
      values (?, ?, ?, ?)
    ", args: args
  end

  def position()
    x, y, width, height = @storage.conn.query_one "select x, y, width, height from sizes", as: {LibC::Float, LibC::Float, LibC::Float, LibC::Float}
    Position.new(x, y, width, height)
  end

  def sync_widget()
    Logger.debug { "Syncing widget" }
    p = position
    @root.resize(p.width, p.height)
    @root.move(p.x, p.y)
  end

end