class BeatablePlayer
  attr_accessor :name, :id, :board

  def initialize(name, id, board)
    @name = name
    @id = id
    @board = board
  end

  def make_next_play
    empties = @board.empties
    board.play(empties[0], @id)
  end
end
