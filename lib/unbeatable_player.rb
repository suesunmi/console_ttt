class UnbeatablePlayer
  attr_accessor :name, :marker, :board

  def initialize(name, marker, board)
    @name = name
    @marker = marker
    @board = board
  end

  def make_next_play
    opponent = @board.opponent(@marker)
    best = best_of_board_using(@board, @marker) do | test_board, depth |
      -(best_for(opponent, test_board))
    end
    @board.play(best[:position], @marker)
  end

  def best_for(player, board)
    opponent = board.opponent(player)
    if board.has_winner
      if board.winner == player
        return 100
      end
      if board.winner == opponent
        return -100
      end
    elsif board.full?
      return 0
    end
    best = best_of_board_using(board, player) do | test_board, depth |
      (-(best_for(opponent, test_board))) + depth
    end
    best[:score]
  end

  def best_of_board_using(board, player)
    choices = Hash.new
    available = board.empties
    available.each do |position|
      test_board = board.clone
      test_board.play(position, player)
      best = yield(test_board, available.length)
      choices[position] = best
    end
    max = choices.values.max
    return Hash[:position, choices.key(max), :score, max]
  end
end
