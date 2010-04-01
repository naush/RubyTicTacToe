require 'ui/console_style'

module Command
  class PlayMoveCommand
    def initialize(game)
      @game = game
    end

    def execute(args)
      if @game.play_move(args[1].upcase, args[2].to_i)
        mark = @game.current_player.get_mark
        move = @game.current_player.get_move

        Ui::ConsoleStyle.print_play_move(mark, move) if @game.play_move(mark, move)

      else
        Ui::ConsoleStyle.print_play_move_usage
      end
    end
  end
end
