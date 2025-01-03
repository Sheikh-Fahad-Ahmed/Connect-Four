# frozen_string_literal: true

require './lib/board'
require './lib/player'
require './lib/messages'

class Game
  include Messages
  attr_accessor :game_board, :players, :current_player

  def initialize
    @game_board = Board.new
    @players = Player.new
    @current_player = @players.player1
  end

  def currently_playing
    @current_player = @current_player == 'X' ? @current_player.player2 : @current_player.player1
  end

  def game_menu
    game_menu_text
    choice = player_choice
    game_menu_choice(choice)
  end

  def game_menu_choice(choice)
    if choice == 1
      start_game
    elsif choice == 2
      how_to_play
    else
      exit 0
    end
  end

  def player_choice
    puts "\nEnter your choice: "
    gets.chomp.to_i
  end

  def start_game
    until check_winning_condition
      @players.playing?(@current_player)
      game_board.show_board
      get_position
      update_board(position)
      
    end
    
  end
end
