require 'spec'
require 'controller/controller'
require 'player/man_player'
require 'player/machine_player'

describe Controller do
  before (:each) do
    @mock_ui = mock("ui")
    @controller = Controller.new(@mock_ui)
  end

  it "should start game" do
    @mock_ui.should_receive(:display_board).with("+++++++++")
    @controller.start_game(:man_player, :machine_player)
    @controller.player1.class.should == Player::ManPlayer
    @controller.player2.class.should == Player::MachinePlayer
  end

  it "should start game if both players are manplayers" do
    @mock_ui.should_receive(:display_board).with("+++++++++")
    @controller.start_game(:man_player, :man_player)
    @controller.player1.class.should == Player::ManPlayer
    @controller.player2.class.should == Player::ManPlayer
  end

  it "should make a move" do
    @controller.player1 = mock("player1")
    @controller.player2 = mock("player2")

    @controller.player1.should_receive(:play_move).with("")

  end
  

end
