class Game
  attr_reader :board, :player_a, :player_b, :whose_turn

  def initialize(board, io, a, b)
    @board = board
    @io= io
    @player_a = a
    @player_b = b
    @whose_turn = nil
    @over = false
  end
  
  def run
    show_welcome
    start_game
    play
    show_goodbye
  end

  def show_welcome
    @io.puts "Welcome to Tic Tac Toe"
  end

  def show_goodbye
    if @board.has_winner
      @io.puts "Congratulations, #{@whose_turn.name}"
    else
      @io.puts "Scratch game, thank you for playing."
    end
  end

  def start_game
    @whose_turn = @player_a
    @over = false
  end

  def play
    begin
      @whose_turn.make_next_play
      evaluate
    end while over? == false
  end

  def over?
    @over
  end

  def evaluate
    if @board.full? || @board.has_winner then
      @over = true 
    end
    if @over == false then 
      toggle_player 
    end
  end

  def toggle_player
    if @whose_turn == @player_a then @whose_turn = @player_b
    elsif @whose_turn == @player_b then @whose_turn = @player_a
    end
  end
end
