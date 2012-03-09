require 'human_player'
require 'board'

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

describe HumanPlayer do

  it "records the play properly" do
    @board = Board.new
    @io = MockIO.new(["7"])
    @player = HumanPlayer.new("Bonnie", "a", @board, @io)
    @player.make_next_play
    @board.mark_at(7).should == @player.marker
  end
end
