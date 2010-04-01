module Ai
  class MiniMax
    def analyze(board, mark)
      @scoreboard = Array.new(board.size)

      for i in 0...board.size
        if board.get_mark(i) == '+'
          board.set(mark, i)
          @scoreboard[i] = nega_max(board, mark)
          board.reset(i)
        else
          @scoreboard[i] = -2
        end
      end

      #puts @scoreboard
      @scoreboard.index(@scoreboard.max)

    end

    def nega_max(board, mark)
      score = evaluate(board, mark)
      return score if (score < 2)

      min = 2

      mark = Board::Board.get_opposite_mark(mark)

      board.each_empty_mark do |index|
        board.set(mark, index)
        val = -nega_max(board, mark)
        board.reset(index)

        return val if (val == -1) # already maximize no need to explore the rest of the tree

        min = val if (val < min)
      end

      return min
    end

    def evaluate(board, mark)
      winner = board.winner
      return 1 if (winner == mark)
      return -1 if (winner == Board::Board.get_opposite_mark(mark))
      return 0 if (winner.nil? && board.full?)
      return 2
    end

  end
end
