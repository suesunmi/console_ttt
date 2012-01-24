require 'game'

describe Game do
  it "returns board with 9 plays, all empty" do
    game = Game.new
    game.board[:one].should == ""
  end
end
