module Ui
  class ConsoleStyle

    def self.print_play_move(mark, move)
      print_msg "play #{mark} #{move}"
    end

    def self.print_play_move_usage
      print_msg 'usage: play $mark $move'
    end

    def self.print_board(board)
      msg = "*===*\n"
      board_string = board.to_s
      (0...board_string.length).step(3) { |i| msg << "|" << board_string[i] << board_string[i+1] << board_string[i+2] << "|\n" }
      msg << "*===*\n"
      print_msg msg
    end

    def self.quit
      print_msg 'quit'
    end

    def self.print_help
      print_msg 'Type list_commands to view a list of implmented commands'

    end

    def self.print_list_commands
      print_msg 'display_board, help, list_commands, new_game, play, quit, select'
    end

    def self.print_select_player
       print_msg '*Select Player 1 (1) or Player 2 (2)*'
    end

    def self.ask_enter_move
      print_msg '*Enter Move (0-8)*'
    end

    def self.print_winner(winner)
      print_msg winner.nil? ? "Draw." : "#{winner} has won."
    end

    def self.print_msg(msg)
      puts msg
      return msg
    end

  end
end
