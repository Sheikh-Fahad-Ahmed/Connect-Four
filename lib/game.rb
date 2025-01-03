# frozen_string_literal: true

require './lib/board'
require './lib/player'
require './lib/messages'

class Game
  include Messages
  attr_accessor :game_board, :players, :currently_playing

  def initialize
    @game_board = Board.new
    @players = Player.new
    @currently_playing = @players.player1
  end

  def game_menu
    game_menu_text
    choice = get_menu_choice
  end

  def get_menu_choice
    puts "\nEnter your choice: "
    gets.chomp.to_i
  end
end


g = Game.new
g.game_menu