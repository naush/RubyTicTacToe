module Ai
  class RuleBased
    def analyze(board, mark)

      center = 4

      @connectingMoves = Array.new
      @breakingMoves = Array.new

      return center if (board.empty?)

      return center if (board.get_mark(center) == '+')

      scan_board(board, mark)

      return @connectingMoves[0] if (@connectingMoves.length > 0)
      return @breakingMoves[0] if (@breakingMoves.length > 0)

      return look_ahead(board, mark)
    end

    def look_ahead(board, mark)
      
      good_moves = Array.new
      bad_moves = Array.new

      board.each_empty_mark do |step_one|
        board.set(mark, step_one)
        scan_board(board, mark)

        if (@connectingMoves.length > 1)
          good_moves << step_one
          board.reset(step_one)
        end

        board.each_empty_mark do |step_two|
          board.set(Board::Board.get_opposite_mark(mark), step_two)
          scan_board(board, mark)
          bad_moves << step_one if (@breakingMoves.length > 1 && @connectingMoves.length == 0)
          board.reset(step_two)
        end

        board.reset(step_one)
      end

      return good_moves[0] if good_moves.length > 0

      board.each_empty_mark { |i| return i if !bad_moves.include?(i) }

      board.each_empty_mark { |i| return i }

    end

    def scan_board(board, mark)
      @connectingMoves = Array.new
      @breakingMoves = Array.new

      Board::Board.all_threes.each do |three|
        empty_position, empty, own_mark, opponent_mark = 0,0,0,0
        three.each do |i|
          if (board.get_mark(i) == '+')
            empty += 1
            empty_position = i
          end
          own_mark += 1 if (board.get_mark(i) == mark)
          opponent_mark += 1 if (board.get_mark(i) == Board::Board.get_opposite_mark(mark))
        end

        @connectingMoves << empty_position if (empty == 1 && own_mark == 2)
        @breakingMoves << empty_position if (empty == 1 && opponent_mark == 2)
      end
    end

  end
end
