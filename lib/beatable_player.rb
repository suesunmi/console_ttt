class BeatablePlayer
  attr_accessor :name, :id, :board

  def initialize(name, id, board)
    @name = name
    @id = id
    @board = board
  end

  def make_next_play
    empties = @board.plays.select { |position, player| player == "" }
    board.play(empties.keys[0], @id)
  end
end
