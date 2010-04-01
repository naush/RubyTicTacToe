require 'ui/console_style'

module Command
  class SelectPlayerCommand
    def initialize(game)
      @game = game
    end

    def execute(args)
      @game.set_player(args[1])
      if (args[1] == 'player2')
        mark = @game.current_player.get_mark
        move = @game.current_player.get_move
        Ui::ConsoleStyle.print_play_move(mark, move)
        @game.play_move(mark, move)
      end
    end
  end
end
