module Command
  class ListCommandsCommand
    def initialize(game, ui)
      @game = game
      @ui = ui
    end

    def execute(args)
      puts 'display_board, help, list_commands, new_game, play, quit'
    end
  end
end
