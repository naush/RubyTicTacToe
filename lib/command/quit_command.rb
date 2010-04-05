require 'ui/console_style'

module Command
  class QuitCommand

    def initialize(game, ui)
      @game = game
      @ui = ui
    end

    def execute(args)
      Ui::ConsoleStyle.quit
      @game.quit
    end
  end
end
