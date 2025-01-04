module Messages

  def game_menu_text
    puts "\n----------------------"
    puts '1. Start Game'
    puts '2. How to Play'
    puts '3. Exit'
    puts "\n----------------------"
  end

  def winner_message
    message = <<~MESSAGE
      Congratulation you win!!
    MESSAGE
    puts message
  end
end