require 'ai/mini_max_evaluate'

module Ai
  class MiniMax

    def analyze(board, mark)
      @scoreboard = Array.new(board.size)

      for i in 0...board.size
        if board.occupied?(i)
          @scoreboard[i] = -2
        else
          board.set(mark, i)
          @scoreboard[i] = nega_max(board, mark)
          board.reset(i)
        end
      end

      @scoreboard.index(@scoreboard.max)
    end

    def nega_max(board, mark)
      score = Ai::MiniMaxEvaluate::evaluate(board, mark)
      return score if (score < 2)

      min = 2

      mark = Board::Board.get_opposite_mark(mark)

      board.each_empty_mark do |index|
        board.set(mark, index)
        alpha = -nega_max(board, mark)
        board.reset(index)

        return alpha if (alpha == -1) # already minimize no need to explore the rest of the tree

        min = alpha if (alpha < min)
      end

      return min
    end

  end

end
