module Player
  class PlayerFactory

    def self.make_player(player_symbol, mark, board)
      if player_symbol == :man_player
        player = make_man_player(mark, board)
      elsif player_symbol == :machine_player
        player = make_machine_player(mark, board)
      end
      return player
    end

    def self.make_man_player(mark, board)
      Player::ManPlayer.new(mark, board)
    end

    def self.make_machine_player(mark, board)
      Player::MachinePlayer.new(mark, board)
    end
  end
end