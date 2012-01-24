require 'game'

class MockIO
  def board_display(board)
    board.values
  end
end

describe Game do
  before(:each) do
    @io = MockIO.new
    @game = Game.new(@io)
  end

  it "displays an empty board" do
    @game.show_board.should == ["", "", "", "", "", "", "", "", ""]
  end
end
