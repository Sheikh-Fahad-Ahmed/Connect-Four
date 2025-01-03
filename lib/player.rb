# frozen_string_literal: true

class Player
  attr_accessor :player1, :player2

  def initialize
    @player1 = 'X'
    @player2 = 'O'
  end

  def display_player_symbols
    puts "\nPlayer 1: #{@player1}\nPlayer 2: #{@player2}"
  end
end
