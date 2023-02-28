class LinkedList 
  attr_reader :head 

  def initialize
    @head = nil
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data) 
    else
      @head.next_node = Node.new(data)
    end
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