require 'beatable_player'
require 'board'

describe BeatablePlayer do
  it "selects next available play" do
    board = Board.new
    io = StringIO.new
    player = BeatablePlayer.new("Mister B", "b", board)
    board.play(1, "a")
    board.play(3, "b")
    board.play(4, "a")
    player.make_next_play
    board.player_at(2).should == "b"
  end
end
