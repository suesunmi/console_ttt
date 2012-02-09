require 'unbeatable_player'
require 'board'

describe UnbeatablePlayer do
  before(:each) do
    @board = Board.new
  end

#  it "blocks opponent's win with 3 plays left" do
#    player = UnbeatablePlayer.new("Computer", "x", @board)
#    @board.play(3, "x")
#    @board.play(5, "o")
#    @board.play(1, "x")
#    @board.play(2, "o")
#    @board.play(6, "x")
#    @board.play(9, "o")
#    player.make_next_play
#    @board.player_at(8).should == "x"
#  end
#
#  it "blocks opponent's win with 3 plays left II" do
#    player = UnbeatablePlayer.new("Computer", "x", @board)
#    @board.play(1, "x")
#    @board.play(6, "x")
#    @board.play(7, "x")
#    @board.play(2, "o")
#    @board.play(4, "o")
#    @board.play(5, "o")
#    player.make_next_play
#    @board.player_at(8).should == "x"
#  end
#
#  it "chooses to win with 3 plays left" do
#    player = UnbeatablePlayer.new("Computer", "x", @board)
#    @board.play(1, "x")
#    @board.play(7, "x")
#    @board.play(9, "x")
#    @board.play(3, "o")
#    @board.play(4, "o")
#    @board.play(5, "o")
#    player.make_next_play
#    @board.player_at(8).should == "x"
#  end
#
#  it "blocks opponent from winning with 5 plays left" do
#    player = UnbeatablePlayer.new("Computer", "x", @board)
#    @board.play(5, "x")
#    @board.play(3, "o")
#    @board.play(8, "x")
#    @board.play(2, "o")
#    player.make_next_play
#    @board.player_at(1).should == "x"
#  end
#
  it "blocks opponent from winning" do
    player = UnbeatablePlayer.new("Computer", "b", @board)
    @board.play(1, "a")
    @board.play(3, "b")
    @board.play(7, "a")
    player.make_next_play
    @board.player_at(4).should == "b"
  end 
#
#  it "choose to win rather than block the opponent" do
#    player = UnbeatablePlayer.new("Computer", "x", @board)
#    @board.play(1, "x")
#    @board.play(2, "o")
#    @board.play(4, "x")
#    @board.play(5, "o")
#    player.make_next_play
#    @board.player_at(7).should == "x"
#  end
end
