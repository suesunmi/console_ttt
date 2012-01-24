class Game
  attr_reader :board

  def initialize(io)
    @board = Hash[:one, "", :two, "", :three, "", :four, "", :five, "", :six, "", :seven, "", :eight, "", :nine, ""]
    @io = io
  end

  def show_board
    @io.board_display(@board)
  end
end
