require 'board'
require 'unbeatable_player'
require 'human_player'
require 'game'

class GamePrepper
  attr_accessor :player_a, :player_b, :game

  def initialize(io)
    @io = io
    @player_a
    @player_b
    @board = Board.new
    @game
  end

  def prep_and_run
    collect_player_preference
    set_up_players
    run_game
  end

  def collect_player_preference
    @io.puts "1 or 2 players?"
    @preference = @io.gets.chomp
  end

  def set_up_players
    @io.puts "What is your name?"
    name_1 = @io.gets.chomp

    if @preference == "1"
      @player_a = UnbeatablePlayer.new("The Computer", "a", @board)
      @player_b = HumanPlayer.new(name_1, "b", @board, @io)
    elsif @preference == "2"
      @io.puts "What is the name of the other player?"
      name_2 = @io.gets.chomp
      @player_a = HumanPlayer.new(name_1, "a", @board, @io)
      @player_b = HumanPlayer.new(name_2, "b", @board, @io)
    end
  end

  def run_game
    @game = Game.new(@board, @io, @player_a, @player_b)
    @game.run
  end
end
