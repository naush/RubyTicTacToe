module Board
  class Board

    def initialize
      @board_string = '+++++++++'
      @all_threes = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    end

    def self.all_threes
      [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    end

    def self.get_opposite_mark(mark)
      mark == 'O' ? 'X' : 'O'
    end

    def set (mark, move)
      if (move >= 0 && move < 9 && get_mark(move) == '+')
        @board_string[move] = mark
        return true
      end
      return false
    end

    def reset(move)
      @board_string[move] = '+'
    end

    def depth
      depth = 0
      for i in 0...@board_string.length
        depth += 1 if @board_string[i].chr != '+'
      end
      return depth
    end

    def occupied? (move)
      @board_string[move].chr != '+'
    end

    def clear_board
      @board_string = '+++++++++'
    end

    def to_s
      @board_string
    end

    def get_mark(position)
      @board_string[position].chr
    end

    def each_mark
      @board_string.each_byte do |ch|
        yield("%c" % ch)
      end
    end

    def each_empty_mark
      for i in 0...@board_string.length
        yield(i) if @board_string[i].chr == '+'
      end
    end

    def winner
      @all_threes.each do |three|
        if (get_mark(three[0]) != '+' &&
            get_mark(three[0]) == get_mark(three[1]) &&
            get_mark(three[0]) == get_mark(three[2]))
          return @board_string[three[0]].chr;
        end
      end
      return nil
    end

    def empty?
      for i in 0...@board_string.length
        return false if @board_string[i].chr != '+'
      end
      return true
    end

    def full?
      for i in 0...@board_string.length
        return false if @board_string[i].chr == '+'
      end
      return true
    end

    def size
      @board_string.length
    end

  end
end
