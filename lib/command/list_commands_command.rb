module Command
  class ListCommandsCommand
    def initialize(game)
      @game = game
    end

    def execute(args)
      puts 'display_board, help, list_commands, new_game, play, quit, select'
    end
  end
end
