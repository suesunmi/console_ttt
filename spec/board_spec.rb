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

  it "displays an empty board" do
    @board.display.should include("1:    |  2:    |  3:    |  \n4:    |  5:    |  6:    |  \n7:    |  8:    |  9:    |  \n")
  end

  it "records plays properly" do
    @board.play(1, "a")
    @board.play(6, "b")
    @board.play(2, "a")
    @board.player_at(1).should == "a"
    @board.player_at(6).should == "b"
    @board.player_at(2).should == "a"
  end
end
