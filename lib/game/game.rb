require 'board/board'

class Game

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @current_player = @player1
    @winner = nil
  end

  attr_reader :current_player, :winner

  attr_accessor :board # should be private

  def play_move(mark, move)
    return false if mark != @current_player.get_mark
    success = @board.set(mark, move)
    switch_player if success
    return success
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def quit
    @winner = 'quitter'
  end

  def is_over?
    return true if @winner == 'quitter'
    @winner = @board.winner
    return true if !@winner.nil?
    return true if @board.full?
    return false
  end

  def set_player(player_symbol)
    reset

    if player_symbol == 'player1'
      @player1 = Player::PlayerFactory::make_player(:man_player, 'O', @board)
      @player2 = Player::PlayerFactory::make_player(:machine_player, 'X', @board)
    elsif player_symbol == 'player2'
      @player1 = Player::PlayerFactory::make_player(:machine_player, 'O', @board)
      @player2 = Player::PlayerFactory::make_player(:man_player, 'X', @board)
    end
    
    @current_player = @player1
  end

  def print_board
    puts @board
  end

  def reset
    @board.clear_board
    @winner = nil
    @current_player = @player1
  end

end
