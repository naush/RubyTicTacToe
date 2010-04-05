require 'ui/console_style'

module Command
  class DisplayBoardCommand
    def initialize(game, ui)
      @game = game
      @ui = ui
    end

    def execute(args)
      Ui::ConsoleStyle.print_board(@game.board)
    end
  end
end
