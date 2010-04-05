module Command
  class CommandFactory

    def self.make_command(id, game, ui)

      command = Command::NoCommand.new(game, ui)

      if (id == 'play')
        command = Command::PlayMoveCommand.new(game, ui)
      elsif (id == 'display_board')
        command = Command::DisplayBoardCommand.new(game, ui)
      elsif (id == 'quit')
        command = Command::QuitCommand.new(game, ui)
      elsif (id == 'new_game')
        command = Command::NewGameCommand.new(game, ui)
      elsif (id == 'help')
        command = Command::HelpCommand.new(game, ui)
      elsif (id == 'list_commands')
        command = Command::ListCommandsCommand.new(game, ui)
      end

      return command
    end

  end
end
