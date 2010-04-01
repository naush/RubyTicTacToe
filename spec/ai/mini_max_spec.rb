require 'spec'
require 'ai/mini_max'
require 'board/board'

describe Ai do

  before(:each) do
    @ai = Ai::MiniMax.new
    @board = Board::Board.new
  end

  it "should score 1 for a win for this basic case" do
    @board.set('O', 0)
    @board.set('O', 1)
    @board.set('O', 2)
    @ai.evaluate(@board, 'O').should == 1
  end

  it "should score 1 for a win" do
    all_threes = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    all_threes.each do |three|
      @board.set('X', three[0])
      @board.set('X', three[1])
      @board.set('X', three[2])
      @ai.evaluate(@board, 'X').should == 1
      @board.clear_board
    end
  end

  it "should score 2 for continue game" do
    @board.set('O', 0)
    @board.set('X', 4)
    @board.set('O', 1)
    @board.set('X', 5)
    @board.set('O', 6)
    @board.set('X', 8)
    @board.set('O', 7)
    @ai.evaluate(@board, 'X').should == 2
  end

  it "should score -1 for a lose for this basic case" do
    @board.set('X', 0)
    @board.set('X', 1)
    @board.set('X', 2)
    @ai.evaluate(@board, 'O').should == -1
  end

  it "should score -1 for a lose" do
    all_threes = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    all_threes.each do |three|
      @board.set('O', three[0])
      @board.set('O', three[1])
      @board.set('O', three[2])
      @ai.evaluate(@board, 'X').should == -1
      @board.clear_board
    end
  end

  it "should return 0 for a draw" do
    @board.set('O', 0)
    @board.set('X', 1)
    @board.set('O', 2)
    @board.set('X', 3)
    @board.set('O', 4)
    @board.set('X', 5)
    @board.set('X', 6)
    @board.set('O', 7)
    @board.set('X', 8)
    @ai.evaluate(@board, 'O').should == 0
  end

  it "should return 0 as the first move due to minimax" do
    @ai.analyze(@board, 'O').should == 0
  end

  it "should prevent opponent from connecting three in a row" do
    @board.set('O', 0)
    @board.set('X', 4)
    @board.set('O', 2)
    @ai.analyze(@board, 'X').should == 1
  end

  it "should play 1 strategically" do
    @board.set('O', 0)
    @board.set('X', 4)
    @board.set('O', 8)
    @ai.analyze(@board, 'X').should == 1
  end

  it "should play the first corner after opponent takes center" do
    @board.set('O', 4)
    @ai.analyze(@board, 'X').should == 0
  end

end