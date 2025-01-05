class Board
  attr_accessor :board

  def initialize
    rows = 6
    columns = 7
    @board = Array.new(rows) { Array.new(columns, '_') }
  end

  def diagonals
    diagonals = []

    # Top-left to bottom-right diagonals (starting from row 3 to row 5)
    (3..5).each do |r|  # Rows from 3 to 5
      diagonal = []
      r.upto(5) do |i|  # Iterate down-right diagonally
        c = i - r
        diagonal << @board[i][c] if c >= 0 && c < 7
      end
      diagonals << diagonal
    end

    # Collect diagonals starting from the topmost row (row 0) to row 2
    (0..2).each do |c|  # Columns from 0 to 2
      diagonal = []
      c.upto(6) do |i|  # Iterate down-right diagonally
        r = i - c
        diagonal << @board[r][i] if r >= 0 && r < 6
      end
      diagonals << diagonal
    end

    # Collect diagonals going bottom-left to top-right (starting from row 4 to row 0)
    (4..5).each do |r|
      diagonal = []
      r.downto(0) do |i|
        c = r - i
        diagonal << @board[i][c] if c >= 0 && c < 7
      end
      diagonals << diagonal
    end

    # Collect diagonals starting from column 0 to column 3 (bottom-left to top-right)
    (0..2).each do |c|
      diagonal = []
      c.downto(0) do |i|
        r = i + c
        diagonal << @board[r][i] if r >= 0 && r < 6
      end
      diagonals << diagonal
    end

    diagonals
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

  def diagonal_win
    diagonals.any? do |diagonal|
      diagonal.each_cons(4).any? { |sub_arr| sub_arr.uniq.size == 1 && sub_arr.first != '_' }
    end
  end

  

end
b = Board.new


b.board = [
          %w[X O X O O _ _],
          %w[_ X _ O _ _ _],
          %w[_ _ X O _ _ _],
          %w[_ _ _ X _ _ _],
          %w[O O X X O _ _],
          %w[O X O X X O _]
]

b.show_board
print b.diagonal_win
