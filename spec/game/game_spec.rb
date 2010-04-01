require 'spec'
require 'game/game'
require 'player/man_player'
require 'player/machine_player'
require 'board/board'

describe Game do
  before(:each) do
    @board = Board::Board.new
    @player1 = Player::ManPlayer.new('O', @board)
    @player2 = Player::MachinePlayer.new('X', @board)
    @game = Game.new(@player1, @player2, @board)
  end

  it "should return current player which is player 1 at start" do
    @game.current_player.is_a?(Player::ManPlayer).should == true
  end

  it "should play move on board" do
    @game.play_move('O', 0)
    @game.board.to_s.should == "O++++++++"
  end

  it "should switch player after a move is played" do
    @game.play_move('O', 0)
    @game.current_player.is_a?(Player::MachinePlayer).should == true
  end

  it "should not switch player if the move played is illegal" do
    @game.play_move('O', -1)
    @game.current_player.is_a?(Player::MachinePlayer).should == false
  end

  it "should return false if game is not over" do
    @game.is_over?.should == false
  end

  it "should return true if game is over" do
    @game.play_move('O', 0)
    @game.play_move('O', 1)
    @game.play_move('O', 2)
    @game.is_over?.should == true
  end

  it "should assign winner when the game is over" do
    @game.play_move('O', 0)
    @game.play_move('O', 1)
    @game.play_move('O', 2)
    @game.is_over?
    @game.winner.should == 'O'
  end
end