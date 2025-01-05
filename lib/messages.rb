module Messages

  def game_menu_text
    puts "\n----------------------"
    puts '1. Start Game'
    puts '2. How to Play'
    puts '3. Exit'
    puts '----------------------'
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

  def draw_message
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

  def rules
    message = <<~HEREDOC
      Welcome to Connect Four!

      Objective:
      The goal of Connect Four is to be the first player to form a horizontal, vertical, or diagonal line of four of your own tokens.

      How to Play:
      1. The game is played on a 6-row by 7-column board.
      2. Players take turns choosing a column to drop their token into.
         - The token will fall to the lowest available position in that column.
      3. The first player to align four tokens in a row, either horizontally, vertically, or diagonally, wins the game.
      4. If the board is completely filled and no player has four in a row, the game ends in a draw.

      Rules:
      - Players alternate turns, with one player using "X" tokens and the other using "O" tokens.
      - A token must be placed in a column that is not already full.
      - A player cannot undo their move once it has been made.

      Have fun and may the best player win!
    HEREDOC
    puts message
  end
end
