require 'spec'
require 'ai/rule_based'
require 'board/board'

describe Board do

  before(:each) do
    @ai = Ai::RuleBased.new
    @board = Board::Board.new
  end

  it "should play center for first move" do
    @ai.analyze(@board, 'O').should == 4
  end

  it "should play a move to break opponent's line" do
    @board.set('X', 0)
    @board.set('X', 4)
    @ai.analyze(@board, 'O').should == 8
  end

  it "should play a move to win" do
    @board.set('O', 0)
    @board.set('O', 4)
    @ai.analyze(@board, 'O').should == 8
  end

  it "should connect your own line before breaking your opponent's" do
    @board.set('O', 0)
    @board.set('O', 1)
    @board.set('X', 3)
    @board.set('X', 4)
    @ai.analyze(@board, 'O').should == 2
  end

  it "should one step look ahead" do
    @board.set('O', 4)
    @board.set('X', 1)
    @board.set('O', 0)
    @board.set('X', 8)
    @ai.analyze(@board, 'O').should == 3
  end

  it "should not make illegal move" do
    @board.set('O', 4)
    @board.set('X', 0)
    @ai.analyze(@board, 'O').should_not == 0
  end
end