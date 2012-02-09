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

  it "validates plays" do
    @board.play(3, "a")
    @board.play(4, "b")
    @board.play(8, "a")
    @board.valid?(4).should be_false
    @board.valid?("x").should be_false
  end

  it "converts string to integer" do
    @board.play("9", "a")
    @board.player_at(9).should == "a"
  end

  it "returns array of available positions" do
    @board.play(1, "x")
    @board.play(2, "x")
    @board.play(3, "x")
    @board.play(4, "x")
    @board.empties.should == [5,6,7,8,9]
    @board.player_at(5).should == ""
    @board.player_at(6).should == ""
    @board.player_at(7).should == ""
    @board.player_at(8).should == ""
    @board.player_at(9).should == ""
  end

  it "identifies the opponent" do
    @board.play(5, "o")
    @board.play(6, "x")
    @board.play(7, "o")
    @board.play(8, "x")
    @board.opponent("o").should == "x"
  end

  it "initializes based on an existing board" do
    @board.play(5, "a")
    @board.play(6, "b")
    another_board = Board.new(@board)
    another_board.player_at(5).should == "a"
    another_board.player_at(6).should == "b"
    another_board.player_at(1).should == ""
    another_board.player_at(2).should == ""
    another_board.player_at(3).should == ""
    another_board.player_at(4).should == ""
    another_board.player_at(7).should == ""
    another_board.player_at(8).should == ""
    another_board.player_at(9).should == ""
    @board.player_at(5).should == "a"
    @board.player_at(6).should == "b"
    @board.player_at(1).should == ""
    @board.player_at(2).should == ""
    @board.player_at(3).should == ""
    @board.player_at(4).should == ""
    @board.player_at(7).should == ""
    @board.player_at(8).should == ""
    @board.player_at(9).should == ""
    @board.object_id != another_board.object_id
  end

  it "initializes with no existing board" do
    @board.player_at(1).should == ""
    @board.player_at(2).should == ""
    @board.player_at(3).should == ""
    @board.player_at(4).should == ""
    @board.player_at(5).should == ""
    @board.player_at(6).should == ""
    @board.player_at(7).should == ""
    @board.player_at(8).should == ""
    @board.player_at(9).should == ""
  end
end
