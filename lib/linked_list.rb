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