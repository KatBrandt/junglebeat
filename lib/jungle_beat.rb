class JungleBeat
  attr_reader :list, :rate, :voice

  def initialize
    @list = LinkedList.new
    @rate = 500
    @voice = "Boing"
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

  def set_rate!(new_rate)
    @rate = new_rate
  end

  def reset_rate!
    @rate = 500
  end

  def play
    beats = @list.to_string
    `say -r #{@rate} #{beats}`
  end

  def all
    @list.to_string
  end
 
end