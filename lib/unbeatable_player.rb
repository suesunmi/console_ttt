class UnbeatablePlayer
  attr_accessor :name, :id, :board

  def initialize(name, id, board)
    @name = name
    @id = id
    @board = board
  end

  def make_next_play
puts "#{@id} looking at board:"
puts @board.display
    opponent = @board.opponent(@id)
    choices = Hash.new
    available = @board.empties
    available.each do |position|
puts "Evaluating position #{position}"
      test_board = Board.new(@board)
      test_board.play(position, @id)

      best = -(best_for(opponent, test_board))
      choices[position] = best
puts "Overall score for #{position} = #{best}"
    end
    optimal_pos = choices.key(choices.values.max)
    @board.play(optimal_pos, @id)
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

    choices = Hash.new
    available = board.empties
    available.each do |position|
      test_board = Board.new(board)
      test_board.play(position, player)
      best = -(best_for(opponent, test_board) + available.length)
      choices[position] = best
puts "If #{player} plays #{position} score is #{best}"
    end
puts "The best possible score for #{player} on this board"
puts board.display
puts "is #{choices.values.max}"
    return choices.values.max
  end
end
