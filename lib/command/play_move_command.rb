require 'ui/console_style'

module Command
  class PlayMoveCommand
    def initialize(game, ui)
      @game = game
      @ui = ui
    end

    def execute(args)
      if @game.play_move(args[1].upcase, args[2].to_i)
        @ui.play_move(args[1].upcase, args[2].to_i)
        
        if @game.current_player.is_a?(Player::MachinePlayer)
          mark = @game.current_player.get_mark
          move = @game.current_player.get_move

          @game.play_move(mark, move)
          @ui.play_move(mark, move)
        end
      else
        Ui::ConsoleStyle.print_play_move_usage
      end

      @ui.declare_winner(@game.winner) if (@game.is_over?)
    end
  end
end
