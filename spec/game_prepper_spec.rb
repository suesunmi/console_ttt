require 'game_prepper'
require 'human_player'
require 'game'

class MockIO
  def initialize(answers)
    @answers = answers
  end

  def puts(string)
  end

  def gets
    @answers.shift
  end
end

describe GamePrepper do
  def two_player_mock_setup
    @io = MockIO.new(["2", "Franz\n", "Sally\n"])
    @prepper = GamePrepper.new(@io)
  end

  def one_player_mock_setup
    @io = MockIO.new(["1", "Franz\n"])
    @prepper = GamePrepper.new(@io)
  end

  it "sets up players in 2 player game" do
    two_player_mock_setup
    @prepper.collect_player_preference
    @prepper.set_up_players
    @prepper.player_a.name.should == "Franz"
    @prepper.player_a.id.should == "a"
    @prepper.player_a.class.should == HumanPlayer
    @prepper.player_b.name.should == "Sally"
    @prepper.player_b.id.should == "b"
    @prepper.player_b.class.should == HumanPlayer
  end

  it "sets up players in 1 player game" do
    one_player_mock_setup
    @prepper.collect_player_preference
    @prepper.set_up_players
    @prepper.player_a.name.should == "The Computer"
    @prepper.player_a.id.should == "a"
    @prepper.player_a.class.should == BeatablePlayer
    @prepper.player_b.name.should == "Franz"
    @prepper.player_b.id.should == "b"
    @prepper.player_b.class.should == HumanPlayer
  end
end
