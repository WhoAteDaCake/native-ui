require "sqlite3"
require "db"
require "log"
require "./version"
require "../lcui"

DB_FILE="data.db"

class Storage
  Logger = Log.for("storage", :debug)
  property conn : DB::Database 
  property should_init : Bool

  def initialize(path : String)
    path = Path[path].join(DB_FILE).expand
    File.delete(path)
    
    init = false
    if !File.exists?(path)
      Logger.info { "Database not found assuming fresh start" }
      init = true
      File.open(path, "w") do |file| end
    end
    
    Logger.info { "Opening sqllite3 connection at #{path.to_s}"}
    @conn = DB.open "sqlite3://#{path.to_s}"
    @should_init = init
    if init
      setup()
    end
  end

  def setup()
    Logger.info { "Running database setup" }
    @conn.exec "create table config (key text NOT NULL UNIQUE, value text NOT NULL)"

    Logger.info { "Inserting data" }
    args = [] of DB::Any
    args << Crymail::VERSION
    @conn.exec "insert into config (key, value) values ('version', ?)", args: args
  end
end