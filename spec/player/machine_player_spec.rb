require 'spec'
require 'player/machine_player'
require 'board/board'

describe Player::MachinePlayer do
  before(:each) do
    @board = Board::Board.new
    @machinePlayer = Player::MachinePlayer.new('X', @board)
  end

  it("should return mark") { @machinePlayer.get_mark.should == 'X' }

end
