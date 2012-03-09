require 'tic_tac_toe'

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

describe TicTacToe do
  def two_player_mock_setup
    @io = MockIO.new(["2", "Franz\n", "Sally\n"])
    @ttt = TicTacToe.new(@io)
  end

  def one_player_mock_setup
    @io = MockIO.new(["1", "Franz\n"])
    @ttt = TicTacToe.new(@io)
  end

  def invalid_pref_mock_setup
    @io = MockIO.new(["x", "2", "o"])
    @ttt = TicTacToe.new(@io)
  end

  it "gives proper feedback for invalid preference" do
    invalid_pref_mock_setup
    @ttt.collect_player_preference
    @io.gets.should == "o"
  end

  it "sets up players in 2 player game" do
    two_player_mock_setup
    @ttt.prep
    @ttt.player_a.name.should == "Franz"
    @ttt.player_a.marker.should == "X"
    @ttt.player_a.class.should == HumanPlayer
    @ttt.player_b.name.should == "Sally"
    @ttt.player_b.marker.should == "O"
    @ttt.player_b.class.should == HumanPlayer
  end

  it "sets up players in 1 player game" do
    one_player_mock_setup
    @ttt.prep
    @ttt.player_a.name.should == "The Computer"
    @ttt.player_a.marker.should == "X"
    @ttt.player_a.class.should == UnbeatablePlayer
    @ttt.player_b.name.should == "Franz"
    @ttt.player_b.marker.should == "O"
    @ttt.player_b.class.should == HumanPlayer
  end
end
