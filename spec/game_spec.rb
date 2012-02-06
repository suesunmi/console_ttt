require 'game'
require 'board'

class MockPlayer
  attr_accessor :name, :id
  def initialize(name, id, plays, board)
    @name = name
    @id = id
    @board = board
    @plays = plays
  end
  def make_next_play
    position = @plays.shift
    position.to_i if position.class == String
    @board.play(position, @id)
  end
end

describe Game do
  before(:each) do
    @board = Board.new
    @io = StringIO.new
  end
  it "displays welcome message" do
    scratch_game_setup
    @game.show_welcome
    @io.string.should include("Welcome to Tic Tac Toe")
  end

  it "decides game is not over after one play" do
    scratch_game_setup
    @player_a.make_next_play
    @game.evaluate
    @game.should_not be_over
  end

  it "decides game is over after 9 plays" do
    scratch_game_setup
    @game.play
    @game.should be_over
  end

  it "decides game is over when there is a winner" do
    winning_game_setup
    @game.play
    @game.should be_over
    @game.whose_turn.name.should == "Bonnie"
    @game.show_goodbye
    @io.string.should include("Congratulations, Bonnie")
  end

  def scratch_game_setup
    @player_a = MockPlayer.new("Bonnie", "a", [2,5,6,7,9], @board)
    @player_b = MockPlayer.new("Clyde", "b", [1,3,4,8], @board)
    @game = Game.new(@board, @io, @player_a, @player_b)
    @game.start_game
  end

  def winning_game_setup
    @player_a = MockPlayer.new("Bonnie", "a", [5,6,3,9], @board)
    @player_b = MockPlayer.new("Clyde", "b", [2,4,1], @board)
    @game = Game.new(@board, @io, @player_a, @player_b)
    @game.start_game
  end
end
