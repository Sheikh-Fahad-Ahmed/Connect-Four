# Connect-Four

Welcome to the **Connect Four** game! This is a classic two-player board game implemented in Ruby, where the goal is to align four tokens in a row, either horizontally, vertically, or diagonally.

## Features

- **6x7 Game Board**: A standard Connect Four board layout.
- **Two Players**: Player 1 uses `X` tokens and Player 2 uses `O` tokens.
- **Win Detection**: Automatically detects horizontal, vertical, and diagonal wins.
- **Draw Condition**: Declares a draw if the board is full and no player has won.
- **Console-based UI**: Clear and simple interaction through the console.

## How to Play

1. Run the game in your terminal.
2. Players take turns selecting a column (1-7) to drop their token.
3. The token falls to the lowest available position in the selected column.
4. The game announces the winner when a player forms a horizontal, vertical, or diagonal line of four tokens.
5. If the board is filled and no player has won, the game ends in a draw.

## Rules

- Players alternate turns, starting with Player 1 (`X`).
- Tokens must be placed in a column that is not already full.
- A player cannot undo their move once it has been made.

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/your-username/connect-four.git
   ```

2. Navigate to the project directory:

   ```bash
   cd connect-four
   ```

3. Run the game:

   ```bash
   ruby lib/main.rb
   ```

## Project Structure


```
connect-four/
├── lib/
│   ├── board.rb       # Board logic and win detection
│   ├── main.rb        # Main game loop and core logic
│   ├── messages.rb    # Contains messages displayed to the players
│   └── player.rb      # Player-related logic
├── spec/
│   ├── board_spec.rb  # Tests for board functionality
│   ├── game_spec.rb   # Tests for game logic
│   └── spec_helper.rb # RSpec configuration
├── README.md          # Project documentation
└── Gemfile            # Dependency management
```



## Testing

This project uses **RSpec** for testing.

1. Install dependencies:

   ```bash
   bundle install
   ```

2. Run the tests:

   ```bash
   rspec
   ```
## License

This project is licensed under the MIT License.

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request for enhancements or bug fixes.

## Acknowledgments

- Inspired by the classic **Connect Four** board game by Milton Bradley.
- Built with Ruby and love!
