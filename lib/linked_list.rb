class LinkedList 
  attr_reader :head 

  def initialize
    @head = nil
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data) 
    else
      get_last_node.next_node = Node.new(data)
    end
  end

  def prepend(data)
    if @head.nil?
      @head = Node.new(data)
    else
      old_head = @head
      @head = Node.new(data)
      @head.next_node = old_head
    end
  end

  def insert(position, data)
    preceding_node = get_previous_node(position)
    new_next_node = preceding_node.next_node
    new_node = preceding_node.next_node = Node.new(data)
    new_node.next_node = new_next_node
  end

  def get_previous_node(position)
    previous_node = @head 
    (position - 1).times do 
      previous_node = previous_node.next_node
    end
    previous_node
  end

  def get_last_node
    last_node = @head
    until last_node.next_node.nil?
      last_node = last_node.next_node
    end
    last_node
  end

  def count 
    counter = 0
    current_node = @head
    while current_node do
      counter += 1 
      current_node = current_node.next_node
    end
    counter
  end

  def to_string 
    string = ""
    current_node = @head 
    while current_node do 
      string << current_node.data + " "
      current_node = current_node.next_node 
    end
    string.strip
  end
end