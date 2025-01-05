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
    @current_player = @players.player2
  end

  def currently_playing
    @current_player = current_player == 'X' ? players.player2 : players.player1
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
      rules
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
      puts "\n------------------------------"
      puts "\nEnter the position you want to drop (1 - 7): "
      input = gets.chomp

      return input.to_i if input.match?(/^\d+$/) && (1..7).include?(input.to_i)

      puts "\nInvalid input. Enter a number between 1 to 7"
    end
  end

  def start_game
    until check_winning_condition
      @current_player = currently_playing
      clear_console
      players.playing?(@current_player)
      game_board.show_board
      loop do
        break if game_board.update_board(position? - 1, @current_player)

        puts "\n The column you entered is full. Try a different column.\n"
      end
    end
  end

  def check_winning_condition
    if game_board.winning_condition == true
      clear_console
      game_board.show_board
      winner_message(current_player)
      exit 0
    elsif game_board.winning_condition == 'draw'
      clear_console
      game_board.show_board
      draw_message
      exit 0
    else
      false
    end
  end

  def clear_console
    system('clear')
  end
end
