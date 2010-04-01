require 'spec'
require 'ui/console_style'
require 'board/board'

describe Ui do
  before(:each) do
    @board = Board::Board.new
  end

  it "should print out the play command" do
    Ui::ConsoleStyle.print_play_move('O', 4).should == 'play O 4'
  end

  it "should print the board" do
    Ui::ConsoleStyle.print_board(@board).should == "+++\n+++\n+++\n"
  end

  it "should print quit" do
    Ui::ConsoleStyle.quit.should == 'quit'
  end

  it "should print help message" do
    Ui::ConsoleStyle.print_help.should == 'Type list_commands to view a list of implmented commands'
  end

  it "should print list commands message" do
    Ui::ConsoleStyle.print_list_commands.should == 'display_board, help, list_commands, new_game, play, quit, select'
  end

end