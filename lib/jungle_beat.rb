class JungleBeat
  attr_reader :list 

  def initialize
    @list = LinkedList.new
  end

  def append(data)
    separated_data = data.split
    separated_data.each do |data|
      @list.append(data)
    end
  end
end