class ConsoleIO
  def board_display(board)
    output = ""
    board.each do |key, value|
      output += "  #{key}: #{value}  |  "
      output += "\n" if [:three, :six, :nine].include?(key)
    end
    puts output
  end
end
