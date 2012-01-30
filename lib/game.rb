require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :player_a, :player_b, :whose_turn

  def initialize(io)
    @board = Board.new
    @io= io
    @player_a = nil
    @player_b = nil
    @whose_turn = nil
    @over = false
  end
  
  def run
    show_welcome
    set_up_players
    start_game
    play
  end

  def show_welcome
    @io.puts "Welcome to Tic Tac Toe"    # text literals shouldn't be here
  end

  def set_up_players
    prompt_first_player_name
    collect_first_player
    prompt_second_player_name
    collect_second_player
  end

  def prompt_first_player_name    # 2 sets of methods for first and second player to account for different prompts
    @io.puts "What is your name?"
  end

  def collect_first_player
    name = @io.gets.chomp
    @player_a = Player.new(name, "a")
  end

  def prompt_second_player_name
    @io.puts "What is the name of the other player?"
  end

  def collect_second_player
    name = @io.gets.chomp
    @player_b = Player.new(name, "b")
  end

  def start_game
    @whose_turn = @player_a
    @over = false
  end

  def play
    begin 
      show_board
      prompt_next_play
      collect_play
      evaluate
    end while over? == false
  end

  def show_board
    @io.puts @board.display
  end

  def prompt_next_play
    @io.puts "#{@whose_turn.name}, enter the position you would like to play:"
  end

  def collect_play
    position = @io.gets
    position = position.to_i if position.class == String    # should game be responsible for manipulating input strings?
    @board.play(position, @whose_turn.id)
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
