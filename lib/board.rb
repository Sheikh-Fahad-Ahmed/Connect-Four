class Board
  attr_accessor :board

  def initialize
    rows = 6
    columns = 7
    @board = Array.new(rows) { Array.new(columns, '_') }
  end

  def diagonals
    diagonals = []

    (3..5).each do |r|
      diagonal = []
      r.upto(5) do |i|
        c = i - r
        diagonal << @board[i][c] if c >= 0 && c < 7
      end
      diagonals << diagonal
    end

    (0..2).each do |c|
      diagonal = []
      c.upto(6) do |i|
        r = i - c
        diagonal << @board[r][i] if r >= 0 && r < 6
      end
      diagonals << diagonal
    end

    (4..5).each do |r|
      diagonal = []
      r.downto(0) do |i|
        c = r - i
        diagonal << @board[i][c] if c >= 0 && c < 7
      end
      diagonals << diagonal
    end

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
    
    (1..7).each { |i| print "#{i} " }
    puts
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
    return 'draw' if board.all? { |row| row.none? { |cell| cell == '_' } }
    return true if horizontal_win || vertical_win || diagonal_win

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

