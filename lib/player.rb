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

  def playing?(current_player)
    puts "\n------------------------------"
    if current_player == 'X'
      puts "Player 1's turn"
    else
      puts "Player 2's turn"
    end
    puts "------------------------------\n\n"
  end
end
