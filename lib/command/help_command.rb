require 'ui/console_style'
module Command
  class HelpCommand
    def initialize(game, ui)
      @game = game
      @ui = ui
    end

    def execute(args)
      Ui::ConsoleStyle.print_help
    end
  end
end
