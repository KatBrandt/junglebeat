class LinkedList 
  attr_reader :head 

  def initialize
    @head = nil
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data) 
    else
      get_last_node(@head).next_node = Node.new(data)
    end
  end

  def get_last_node(node)
    if node.next_node.nil?
      return node
    end

    new_node = node.next_node
    get_last_node(new_node)
  end

  def count
    return 0 if @head.nil?
    count_from_head(@head)
  end

  def count_from_head(node)
    if node.next_node.nil?
      return 1
    end

    total = 1 + count_from_head(node.next_node)
    total
  end

  def to_string
    string_from_head(@head)
  end 

  def string_from_head(node)
   if node.next_node.nil?
    return node.data
   end
   
   data_string = node.data + " " + string_from_head(node.next_node)
  end
end