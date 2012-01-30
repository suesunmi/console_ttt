require 'game'

describe Game do

  before(:each) do
    @io = StringIO.new
    @game = Game.new(@io)
  end

  it "displays welcome message" do
    @game.show_welcome
    @io.string.should include("Welcome to Tic Tac Toe")
  end

  it "displays prompt for first player" do
    @game.prompt_first_player_name
    @io.string.should include("What is your name?")
  end

  it "collects and saves first player" do
    @io.string = "Franz\n"
    @game.collect_first_player
    @game.player_a.name.should == "Franz"
    @game.player_a.id.should == "a"
  end

  it "displays prompt for second player" do
    @game.prompt_second_player_name
    @io.string.should include("What is the name of the other player?")
  end

  it "collects and saves the second player" do
    @io.string = "Sally\n"
    @game.collect_second_player
    @game.player_b.name.should == "Sally"
  end

  it "displays an empty board" do
    @game.show_board
    @io.string.should include("1:    |  2:    |  3:    |  \n4:    |  5:    |  6:    |  \n7:    |  8:    |  9:    |  \n")
  end

  it "starts the game and sets the first player" do
    @io.string = "Jack"
    @game.collect_first_player
    @io.string = "Jill"
    @game.collect_second_player
    @game.start_game
    @game.whose_turn.should == @game.player_a
    @game.player_a.name.should == "Jack"
    @game.player_b.name.should == "Jill"
  end

  it "prompts the correct user for the first play" do
    bonnie_clyde_game_setup
    @game.prompt_next_play
    @io.string.should include("Bonnie, enter the position you would like to play:")
  end

  it "collects and records the first play properly" do
    bonnie_clyde_game_setup
    make_a_play("7")
    @game.board.player_at(7).should == @game.whose_turn.id
  end

  it "decides game is not over after one play" do
    bonnie_clyde_game_setup
    make_a_play("8")
    @game.evaluate
    @game.should_not be_over
  end

  it "decides game is over after 9 plays" do
    bonnie_clyde_game_setup
    (1..9).each do |int|
      make_a_play(int.to_s)
    end
    @game.evaluate
    @game.should be_over
  end

  it "toggles user and records the second play" do
    bonnie_clyde_game_setup
    make_a_play("7")
    @game.whose_turn.name.should == "Bonnie"
    @game.board.player_at(7).should == @game.whose_turn.id
    @game.evaluate
    make_a_play("8")
    @game.whose_turn.name.should == "Clyde"
    @game.board.player_at(8).should == @game.whose_turn.id
  end

  it "decides game is over when there is a winner" do
    bonnie_clyde_game_setup
    make_a_play("1")
    @game.evaluate
    make_a_play("6")
    @game.evaluate
    make_a_play("2")
    @game.evaluate
    make_a_play("7")
    @game.evaluate
    make_a_play("3")
    @game.evaluate
    @game.should be_over
  end

  # handles invalid or empty input

  def bonnie_clyde_game_setup
    @io.string = "Bonnie"
    @game.collect_first_player
    @io.string = "Clyde"
    @game.collect_second_player
    @game.start_game
  end

  def make_a_play(position)
    @io.string = position
    @game.collect_play
  end
end

# specs for Player and Board.  Can any tests be moved to board spec?
