require 'board'
require 'unbeatable_player'
require 'human_player'
require 'game'

class TicTacToe
  attr_accessor :player_a, :player_b, :game

  def initialize(io)
    @io = io
    @player_a
    @player_b
    @board = Board.new
    @game
  end

  def run
    prep
    start
  end

  def prep
    collect_player_preference
    set_up_players
  end

  def collect_player_preference
    @preference = ""
    until @preference == "1" || @preference == "2"
      @io.puts "1 or 2 players?"
      @preference = @io.gets.chomp
    end
  end

  def set_up_players
    @io.puts "What is your name?"
    name_1 = @io.gets.chomp

    if @preference == "1"
      @player_a = UnbeatablePlayer.new("The Computer", "X", @board)
      @player_b = HumanPlayer.new(name_1, "O", @board, @io)
    elsif @preference == "2"
      @io.puts "What is the name of the other player?"
      name_2 = @io.gets.chomp
      @player_a = HumanPlayer.new(name_1, "X", @board, @io)
      @player_b = HumanPlayer.new(name_2, "O", @board, @io)
    end
  end

  def start
    @game = Game.new(@board, @io, @player_a, @player_b)
    @game.run
  end
end
