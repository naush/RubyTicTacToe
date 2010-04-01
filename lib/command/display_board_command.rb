require 'ui/console_style'

module Command
  class DisplayBoardCommand
    def initialize(game)
      @game = game
    end

    def execute(args)
      Ui::ConsoleStyle.print_board(@game.board)
    end
  end
end
