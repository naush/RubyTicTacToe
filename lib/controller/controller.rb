require 'game/game'
require 'player/player_factory'
require 'board/board'
require 'command/display_board_command'
require 'command/help_command'
require 'command/list_commands_command'
require 'command/new_game_command'
require 'command/no_command'
require 'command/play_move_command'
require 'command/quit_command'
require 'command/command_factory'

module Controller

  class Controller
    include Java::gui.swing.listener.TicTacToeControllerInterface

    def initialize(ui)
      @ui = ui
    end

    attr_reader :player1
    attr_reader :player2

    def new_game (player1, player2)
      @board = Board::Board.new

      @player1 = Player::PlayerFactory::make_player(player1, 'O', @board)
      @player2 = Player::PlayerFactory::make_player(player2, 'X', @board)

      @game = Game.new(@player1, @player2, @board)

      if @player1.is_a?(Player::MachinePlayer)

        do_command("play #{get_current_mark} #{@game.current_player.get_move}")

        if (@player2.is_a?(Player::MachinePlayer))
          while !@game.is_over?
            do_command("play #{get_current_mark} #{@game.current_player.get_move}")
          end
          @ui.declare_winner(@game.winner)
        end
      end
    end

    def get_current_mark
      @game.current_player.get_mark
    end

    def reset_game
      @game.reset
    end

    def do_command(args)
      args = args.split
      command = Command::CommandFactory::make_command(args[0], @game, @ui)
      execute_command(command, args)
    end

    def execute_command(command, args)
      command.execute(args)
    end

    def game_over?
      @game.is_over?
    end

    def get_version
      return "1.0"
    end
    
  end

end
