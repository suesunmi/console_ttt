class Board
  attr_accessor :plays
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
    @winning_mark
  end

  def display
    output = ""  
    @plays.each do |position, marker|
      output += "#{position}: #{marker}  |  "
      output += "\n" if position % 3 == 0
    end
    output
  end

  def full?
    full = true
    (1..9).each do |position| 
      full = false if @plays[position] == ""
    end
    full
  end

  def has_winner
    do_scoring
    return @winning_mark != nil
  end

  def do_scoring
    @winning_combos.each do |combo|
      a = combo[0]
      b = combo[1]
      c = combo[2]
      if  @plays[a] != "" && @plays[a] == @plays[b] && @plays[b] == @plays[c]
        @winning_mark = @plays[c]
        break
      end
    end
  end

  
end
