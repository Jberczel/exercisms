Node = Struct.new(:value, :next, :prev)

class Deque
  def initilize
    @head = nil
    @tail = nil
  end

 

  def pop
    tmp = @tail
    @tail = tmp.prev
    tmp.value 
  end

  def shift
    tmp = @head
    @head = tmp.next
    tmp.value
  end

  def add(value)
    new_node = Node.new(value, nil, nil)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      yield(new_node)
    end
  end

   def push(value)
    # new_node = Node.new(value, nil, nil)
    # if @head.nil?
    #   @head = new_node
    #   @tail = new_node
    # else
    #   old_tail = @tail
    #   old_tail.next = new_node
    #   @tail = new_node
    #   @tail.prev = old_tail
    # end
    add(value) do |new_tail|
      old_tail = @tail
      old_tail.next = new_tail
      @tail = new_tail
      @tail.prev = old_tail
    end

  end

  def unshift(value)
    new_node = Node.new(value,nil, nil)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      old_head = @head
      old_head.prev = new_node
      @head = new_node
     new_node.next = old_head
    end
  end

end

ll = Deque.new
ll.push(10)
ll.push(20)

p ll