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

  def position?
    loop do
      puts "\nEnter the position you want to drop (1 - 7): "
      input = gets.chomp.to_i

      return input if input.match?(/^\d+$/) && (1..7).include?(input)

      puts "\nInvalid input. Enter a number between 1 to 7"
    end
  end

  def start_game
    until check_winning_condition
      players.playing?(@current_player)
      game_board.show_board
      loop do
        break if game_board.update_board(position?, @current_player)

        puts "\n The column you entered is full. Try a different column.\n"
      end
      @current_player = currently_playing
    end
  end

  def check_winning_condition
    if game_board.winning_condition == true
      winner_message
    elsif game_board.winning_condition == 'draw'
      draw_message
    else
      false
    end
  end
end

b = Board.new
6.times { b.update_board(3, 'X') }
b.show_board
b.update_board(3, 'O')
