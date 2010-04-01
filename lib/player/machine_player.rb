require 'ai/mini_max'
require 'ai/rule_based'

module Player
  class MachinePlayer

    def initialize(mark, board, ai='minimax')
      @mark = mark
      @board = board
      if (ai == 'minimax')
        @ai = Ai::MiniMax.new
      elsif (ai == 'rulebased')
        @ai = Ai::RuleBased.new
      end
    end

    def get_mark
      @mark
    end

    def get_move
      @ai.analyze(@board, @mark)
    end

=begin

   	def alpha_beta(mark, board, alpha, beta)
	  score = scoring(board.evaluate, mark)
	  return score if !score.nil?
	  for i in 0...board.size
	    if (board.get_mark(i) == '+')
	      mark = get_opposite_mark(mark)
	      board.set(mark, i)
	      alpha = [alpha, -alpha_beta(mark, board, -beta, -alpha)].max
	      board.reset(i)
		  if (beta <= alpha)
		    break
          end
		end
	  end
	  return alpha
	end

=end

  end
end
