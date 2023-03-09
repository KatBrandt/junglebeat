class JungleBeat
  attr_reader :list 

  def initialize
    @list = LinkedList.new
    @valid_beats = %w(tee dee deep ditt bop boop la na shu doo woo hoo)
  end

  def append(data)
    separated_data = data.split
    separated_data.each do |data|
      if @valid_beats.include?(data)
        @list.append(data)
      end
    end
  end

  def play
    beats = @list.to_string
    `say -r 500 #{beats}`
  end

  def all
    @list.to_string
  end
 
end