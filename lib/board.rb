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

  def vertical_win
    flag = 0
    6.times do |i|
      if board[i][3] == 'X'
        flag += 1
        return true if flag == 4
      else
        flag = 0
      end
    end
    false
  end
end

b = Board.new
b.update_board(3, 'O')
4.times do
  b.update_board(3, 'X')
end
b.update_board(3, 'O')
b.show_board

print b.vertical_win
