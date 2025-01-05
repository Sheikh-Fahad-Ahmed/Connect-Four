module Messages

  def game_menu_text
    puts "\n----------------------"
    puts '1. Start Game'
    puts '2. How to Play'
    puts '3. Exit'
    puts "----------------------"
  end

  def winner_message(current_player)
    player = if current_player == 'X'
               1
             else
               2
             end
    message = <<~MESSAGE
      \n\n
      ------------------------------
      Congratulation Player #{player} wins!!!
      ------------------------------
      \n
    MESSAGE
    puts message
  end

  def draw_message(current_player)
    message = <<~MESSAGE
      \n\n
      ------------------------------
      The Board is full. It's a Draw
      Thank you for playing.
      ------------------------------
      \n
    MESSAGE
    puts message
  end
end