
class UnbeatablePlayer
  attr_accessor :name, :id, :board

  def initialize(name, id, board)
    @name = name
    @id = id
    @board = board
    @tabs = Hash.new
  end

  def make_next_play
    opponent = @board.opponent(@id)
    choices = Hash.new
    available = @board.empties
    available.each do |position|
      test_board = Board.new(@board)
      test_board.play(position, @id)
puts "If #{@id} plays #{position}"
puts test_board.display
@tabs[test_board.object_id] = ""
      best = -(best_for(opponent, test_board))
      choices[position] = best
    end
    optimal_pos = choices.key(choices.values.max)
    @board.play(optimal_pos, @id)
  end

  def best_for(player, board)
    opponent = board.opponent(player)
    if board.has_winner
      if board.winner == player
puts @tabs[board.object_id] + "#{player} wins!!!"
        return 100
      end
      if board.winner == opponent
puts @tabs[board.object_id] + "#{opponent} wins!!!"
        return -100
      end
    elsif board.full?
puts @tabs[board.object_id] + "Nobody wins!!!"
      return 0
    end

    choices = Hash.new
    available = board.empties
    available.each do |position|
      test_board = Board.new(board)
tab_string = ""
(6 - test_board.empties.size).times{ tab_string += "  " }
@tabs[test_board.object_id] = tab_string
      test_board.play(position, player)
puts tab_string + "and #{player} plays #{position}"
      best = -(best_for(opponent, test_board))
      best += available.length
      choices[position] = best
puts tab_string + "That means the overall score is #{best} for #{player}"
    end
    return choices.values.max
  end
end
