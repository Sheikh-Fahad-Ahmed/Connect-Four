class Board
  attr_accessor :board

  def initialize
    rows = 6
    columns = 7
    @board = Array.new(rows) { Array.new(columns, '_') }
  end

  def show_board
    @board.each do |row|
      puts row.map { |cell| cell }.join(' ')
    end
  end
end


