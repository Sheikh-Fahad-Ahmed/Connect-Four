class Board
  attr_accessor :board

  def initialize
    rows = 6
    columns = 7
    @board = Array.new(rows) { Array.new(columns, '_') }
  end

  def show_board
    @board.each do |row|
      puts row.join(' ')
    end
  end

  def update_board(position, player_symbol)
    column = position
    row = @board.rindex { |r| r[column] == '_' }
    return 'error' if row.nil?

    @board[row][column] = player_symbol
    true
  end

  def winning_condition
    flag = 0
    7.times do |i|
      if board[5][i] == 'X'
        flag += 1
        return true if flag == 4
      else
        flag = 0
      end
    end
    false
  end

  def horizontal_win
    board.any? do |row|
      row.join.include?('XXXX') || row.join.include?('OOOO')
    end
  end

  def vertical_win
    board.transpose.any? do |row| # Transpose changes columns into rows
      row.join.include?('XXXX') || row.join.include?('OOOO')
    end
  end
end
b = Board.new
# b.update_board(3, 'O')
# 4.times do
#   b.update_board(3, 'X')
# end
# b.update_board(3, 'O')
# b.show_board


b.board = [
  ['_', 'O', 'X', 'O', 'O', '_', '_'],
  ['_', '_', '_', 'O', '_', '_', '_'],
  ['_', '_', '_', 'O', '_', '_', '_'],
  ['_', '_', '_', 'O', '_', '_', '_'],
  ['O', 'O', 'X', 'X', 'X', '_', '_'],
  ['O', 'X', 'O', 'X', 'X', '_', '_']
]

b.show_board
print b.vertical_win