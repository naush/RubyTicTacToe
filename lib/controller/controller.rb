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
require 'command/select_player_command'

module Controller

  class Controller

    def initialize(ui)
      @ui = ui
    end

    attr_reader :player1, :player2

    # initialize command stack

    def start_game(player1, player2)
      @board = Board::Board.new

      @player1 = Player::PlayerFactory::make_player(player1, 'O', @board)
      @player2 = Player::PlayerFactory::make_player(player2, 'X', @board)

      @game = Game.new(@player1, @player2, @board)
    end

    def run_game
      while (!@game.is_over?)
        print '?'
        args = gets.split
        command = parse_command(args[0])
        execute_command(command, args)
      end
    end

    ## ask for command
    # help
    # list_commands
    # select player1 or player2
    # display_strategies
    # strategy $option (default: mini_max?)
    # play $mark $move
    # clear_board
    # start_game
    # print_board
    # quit
    # undo?
    #

    def parse_command(id)

      command = Command::NoCommand.new(@game)

      if (id == 'play')
        command = Command::PlayMoveCommand.new(@game)
      elsif (id == 'display_board')
        command = Command::DisplayBoardCommand.new(@game)
      elsif (id == 'select')
        command = Command::SelectPlayerCommand.new(@game)
      elsif (id == 'quit')
        command = Command::QuitCommand.new(@game)
      elsif (id == 'new_game')
        command = Command::NewGameCommand.new(@game)
      elsif (id == 'help')
        command = Command::HelpCommand.new(@game)
      elsif (id == 'list_commands')
        command = Command::ListCommandsCommand.new(@game)
      end

      return command

      # !!!undo!!!
      # only push play move command on stack/queue
      # flush stack when start new game
      # undo will pop the stack or dequeue to recreate the game without the last move

      # split input by space and match the first argument
      # read in arguments
      # create command object
      # push on stack
      # call execute
    end

    def execute_command(command, args)
      command.execute(args)
    end

  end

end
