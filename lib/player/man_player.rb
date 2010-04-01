module Player
  class ManPlayer
    def initialize(mark, board)
      @mark = mark
      @board = board
    end

    def get_move
      # should be handled by ui?
      0
    end

    def get_mark
      @mark
    end
  end
end
