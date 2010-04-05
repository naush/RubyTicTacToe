module Ai
  class MiniMaxEvaluate
    def self.evaluate(board, mark)
      winner = board.winner
      return 1 if (winner == mark)
      return -1 if (winner == Board::Board.get_opposite_mark(mark))
      return 0 if (winner.nil? && board.full?)
      return 2
    end
  end
end
