require 'human_player'
require 'board'

describe HumanPlayer do
  before(:each) do
    @board = Board.new
    @io = StringIO.new
    @player = HumanPlayer.new("Bonnie", "a", @board, @io)
  end

  it "display prompt for next play" do
    @player.prompt_next_play
    @io.string.should include("Bonnie, enter the position you would like to play:")
  end

  it "records the play properly" do
    @io.string = "7"
    @player.collect_play
    @board.player_at(7).should == @player.id
  end
end
