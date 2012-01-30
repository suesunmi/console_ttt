class Board
  def initialize
    @plays = Hash[ 1, "", 2, "", 3, "", 4, "", 5, "", 6, "", 7, "", 8, "", 9, ""]
    @winning_combos = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [3,5,7]
    ]
    @winner
  end

  def display    # display string should not be board's responsibility
    output = ""  
    @plays.each do |position, player|
      output += "#{position}: #{get_display_mark(player)}  |  "
      output += "\n" if position % 3 == 0
    end
    output
  end

  def get_display_mark(player)    # display string should not be board's responsibility
    if player == "a"
      "X"
    elsif player == "b"
      "O"
    else
      " "
    end
  end

  def player_at(position)
    @plays[position]
  end

  def full?
    full = true
    (1..9).each do |position| 
      full = false if @plays[position] == ""
    end
    full
  end

  def play(position, who)
    @plays[position] = who
  end

  def has_winner
    do_scoring
    return @winner != nil
  end

  def do_scoring
    @winning_combos.each do |pos|
      a = pos[0]
      b = pos[1]
      c = pos[2]
      if  @plays[a] != "" && @plays[a] == @plays[b] && @plays[b] == @plays[c]    # this feels ugly
        @winner = @plays[c]
        break
      end
    end
  end

  
end
