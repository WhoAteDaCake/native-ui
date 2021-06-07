require "log"
require "../crymail/storage"

class Window
  Logger = Log.for("window", :debug)

  class Position
    property x, y, width, height

    def initialize(
      @x : LibC::Int,
      @y : LibC::Int,
      @width : LibC::Int,
      @height : LibC::Int
    )
    end

    def update_size(width : LibC::Int, height : LibC::Int)
      @width = width
      @height = height
    end
  end

  @storage : Storage
  @root : Widget

  def initialize(@storage : Storage, @root : Widget)
    if @storage.should_init
      init (Position.new(0, 0, 400, 400))
    end
  end

  def init(pos)
    Logger.info { "Initialising size table" }
    @storage.conn.exec "
      create table sizes (x int, y int, width int, height int)"
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
    x, y, width, height = @storage.conn.query_one "select x, y, width, height from sizes", as: {LibC::Int, LibC::Int, LibC::Int, LibC::Int}
    Position.new(x, y, width, height)
  end

  def sync_widget(p : Position)
    Logger.debug { "Syncing widget" }
    @root.resize(p.width.to_f32, p.height.to_f32)
    # TODO: move command
  end

end