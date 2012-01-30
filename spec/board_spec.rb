require 'board'

describe Board do
  before(:each) do
    @board = Board.new
  end
  it "marks the play properly" do
    @board.play(2, "a")
    @board.play(2, "a")
  end
  it "knows it's not full with after just 3 plays" do
    @board.play(2, "a")
    @board.play(5, "b")
    @board.play(7, "a")
    @board.should_not be_full
  end
  it "knows when there is a winner" do
    @board.play(1, "a")
    @board.play(6, "b")
    @board.play(2, "a")
    @board.play(7, "b")
    @board.play(3, "a")
    @board.has_winner.should == true
  end
end
