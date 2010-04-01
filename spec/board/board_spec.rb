require 'spec'
require 'board/board'

describe Board do
  
  before(:each) do
    @board = Board::Board.new
    @blank_board = "+++++++++"
  end

  it("should return the board string") { @board.to_s.should == @blank_board }

  it "should return depth of board" do
    for i in 0...@board.size
      @board.set('O', i)
      @board.depth.should == i+1
    end
  end

  it "should set move" do
    @board.set('O', 0)
    @board.to_s.should == "O++++++++"
  end

  it "should reset move" do
    @board.set('O', 0)
    @board.reset(0)
    @board.get_mark(0).should == '+'
  end

  it "should ignore negative move" do
    @board.set('O', -1).should == false
    @board.to_s.should == @blank_board
  end

  it "should ignore out of range move" do
    @board.set('O', 9).should == false
    @board.to_s.should == @blank_board
  end

  it "should ignore duplicated move" do
    @board.set('O', 0)
    @board.set('X', 0)
    @board.get_mark(0).should == 'O'
  end

  it "should clear board" do
    @board.set('O', 0)
    @board.clear_board
    @board.to_s.should == @blank_board
  end

  it "should return true if occupied" do
    @board.set('O', 0)
    @board.occupied?(0).should == true
  end

  it "should return nil if game is not over" do
    @board.winner.should == nil
  end

  it "should return true if board is empty" do
    @board.empty?.should == true
  end

  it "should return false if board is not filled" do
    @board.full?.should == false
  end

  it "should return true if board is filled" do
    for i in 0...@board.size
      @board.set('O', i)
    end
    @board.full?.should == true
  end

  it "should return the size of board" do
    @board.size.should == 9
  end

  it "should evaluate to O for this basic case" do
    @board.set('O', 0)
    @board.set('O', 1)
    @board.set('O', 2)
    @board.winner.should == 'O'
  end

  it "should evaluate to X" do
    Board::Board.all_threes.each do |three|
      @board.set('X', three[0])
      @board.set('X', three[1])
      @board.set('X', three[2])
      @board.winner.should == 'X'
      @board.clear_board
    end
  end

  it "should evaluate to nil" do
    @board.winner.should == nil
  end

  it "should evaluate to nil for draw" do
    @board.set('O', 0)
    @board.set('X', 1)
    @board.set('O', 2)
    @board.set('X', 3)
    @board.set('O', 4)
    @board.set('X', 5)
    @board.set('X', 6)
    @board.set('O', 7)
    @board.set('X', 8)
    @board.full?.should == true
    @board.winner.should == nil
  end

  it "should iterate empty marks and return respective position" do
    marks = []
    @board.each_empty_mark do |empty|
      marks << empty
    end
    marks.should == [0,1,2,3,4,5,6,7,8]
  end

  it "should iterate marks" do
    @board.set('O', 0)
    @board.set('X', 1)
    @board.set('X', 3)
    @board.set('O', 4)
    @board.set('X', 6)
    @board.set('O', 7)
    @board.set('X', 8)

    marks = []
    @board.each_mark do |mark|
      marks << mark
    end

    marks.should == ["O", "X", "+", "X", "O", "+", "X", "O", "X"]

  end

  it "should return opposite mark" do
    Board::Board.get_opposite_mark('O').should == 'X'
  end

end