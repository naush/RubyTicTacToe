require 'ui/console_style'

module Ui
  class Console
    def initialize(io)
      @io = io
    end
    
    def set_controller(controller)
      @controller = controller
    end

    def new_game

      while (true)
        Ui::ConsoleStyle::print_select_player
        @io.puts '*Select Player 1 (1) or Player 2 (2)*'
        selection = @io.test_gets.to_i
        if (selection == 1)
          @controller.new_game("ManPlayer", "MachinePlayer")
          break
        elsif (selection == 2)
          @controller.new_game("MachinePlayer", "ManPlayer")
          break
        end
      end

      while (!@controller.game_over?)
        @io.puts("*Enter Move (0-8)*")
        Ui::ConsoleStyle::ask_enter_move
        args = @io.test_gets
        args = "play" + " #{@controller.get_current_mark} " + args
        @controller.do_command(args)
        @controller.do_command('display_board')
      end
      
    end

    def play_move(mark, move)
      message = "play #{mark} #{move}"
      @io.puts message
      puts message
    end

    def declare_winner(winner)
      message = winner.nil? ? 'Draw.' : "#{winner} has won."
      Ui::ConsoleStyle::print_winner(winner)
      @io.puts message
    end

  end
end
