require 'ui/console_style'

module Command
  class QuitCommand

    def initialize(game)
      @game = game
    end

    def execute(args)
      Ui::ConsoleStyle.quit
      @game.quit
    end
  end
end
