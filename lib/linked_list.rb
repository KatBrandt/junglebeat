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
    # last_node = @head
    # until last_node.next_node.nil?
    #   last_node = last_node.next_node
    # end
    # last_node

    get_previous_node(count)
  end

  def find(position, amount)
    final_string = ""
    starting_node = get_previous_node(position + 1)
    amount.times do 
      final_string << starting_node.data + " "
      starting_node = starting_node.next_node
    end
    final_string.strip
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

  def pop
    next_to_last_node = get_previous_node(count - 1)
    old_last_node = next_to_last_node.next_node
    next_to_last_node.next_node = nil 
    old_last_node.data
  end

  def includes?(word)
    data_check = false
    current_node = @head
    while current_node do
      if current_node.data == word
        data_check = true 
        break
      end
      current_node = current_node.next_node
    end
    data_check
  end
end