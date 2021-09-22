class Context(T)
  alias Id = Int64

  @id : Id = 0
  @state : T
  @subscribers : Hash(Id, (T -> Void))
  
  def initialize(@state : T)
    @subscribers = Hash(Id, (T -> Void)).new
  end

  def state
    @state
  end

  def get_id()
    id = @id
    @id += 1
    id
  end

  def listen(cb : T -> Void)
    id = get_id
    @subscribers[id] = cb
    id
  end

  def listen(&cb : T -> Void)
    listen(cb)
  end

  def unlisten(id : Id)
    @subscribers.delete(id)
  end

  def notify()
    @subscribers.each do |key, cb|
      cb.call(@state)
    end
  end

  def update(value : T)
    @state = value
    notify  
  end

  def update(&block : T -> T)
    update block.call(@state)
  end
end
