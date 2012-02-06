class HumanPlayer
  attr_accessor :name, :id
  def initialize(name, id, board, io)
    @name = name
    @id = id
    @board = board
    @io = io
  end
  def make_next_play
    prompt_next_play
    collect_play
  end

  def prompt_next_play
    @io.puts @board.display
    @io.puts "#{@name}, enter the position you would like to play:"
  end

  def collect_play
    position = "0"
    until (1..9).include?(position.to_i)
      position = @io.gets.chomp
    end
    position = position.to_i if position.class == String
    @board.play(position, @id)
  end
end
