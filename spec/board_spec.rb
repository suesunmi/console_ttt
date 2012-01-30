require 'board'

describe Board do
  before(:each) do
    @board = Board.new
  end
  it "marks the play properly" do
    @board.plays[2] = "X"
    @board.plays[2].should == "X"
  end
  it "knows it's not full with after just 3 plays" do
    @board.plays[2] = "X"
    @board.plays[5] = "O"
    @board.plays[7] = "X"
    @board.should_not be_full
  end
  it "knows when there is a winner" do
    @board.plays[1] = "X"
    @board.plays[6] = "O"
    @board.plays[2] = "X"
    @board.plays[7] = "O"
    @board.plays[3] = "X"
    @board.has_winner.should == true
  end
end
