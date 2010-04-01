require 'spec'
require 'player/man_player'
require 'board/board'

describe ManPlayer do
  before(:each) do
    @board = Board.new
    @manPlayer = ManPlayer.new('O', @board)
  end

  it("should return 0") { @manPlayer.get_move.should == 0 }

  it("should return mark") { @manPlayer.get_mark.should == 'O' }

end
