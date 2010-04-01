module Ui
  class ConsoleStyle

    def self.print_play_move(mark, move)
      print_msg "play #{mark} #{move}"
    end

    def self.print_play_move_usage
      print_msg 'usage: play $mark $move'
    end

    def self.print_board(board)
      msg = ''
      board_string = board.to_s
      (0...board_string.length).step(3) { |i| msg << board_string[i] << board_string[i+1] << board_string[i+2] << "\n" }
      print_msg msg
    end

    def self.quit
      print_msg 'quit'
    end

    def self.select_player_usage
      print_msg 'usage: select player1 (player2)'
    end

    def self.print_help
      print_msg 'Type list_commands to view a list of implmented commands'

    end

    def self.print_list_commands
      print_msg 'display_board, help, list_commands, new_game, play, quit, select'
    end

    def self.print_msg(msg)
      puts msg
      return msg
    end
  end
end
