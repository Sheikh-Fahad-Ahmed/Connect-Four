require './lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#initialize' do
    context 'when board class is initialized' do
      it 'create an array of 42 elements' do
        expect(board.board).to be_an_instance_of(Array)
        expect(board.board.flatten.size).to eq(42)
      end
    end
  end

  describe '#show_board' do
    context 'when show_board method is called' do
      it 'prints the board correctly' do
        expected_output = <<~BOARD
          _ _ _ _ _ _ _
          _ _ _ _ _ _ _
          _ _ _ _ _ _ _
          _ _ _ _ _ _ _
          _ _ _ _ _ _ _
          _ _ _ _ _ _ _
        BOARD

        expect { board.show_board }.to output(expected_output).to_stdout
      end
    end
  end

  describe '#update_board' do
    context 'when valid position is provided' do
      it 'updates the given position with player symbol' do
        board.update_board(3, 'X')
        expect(board.board[5][3]).to eq('X')
      end

      it 'updates the lowest possible row with the player symbol' do
        board.update_board(3, 'X')
        board.update_board(3, 'O')
        expect(board.board[5][3]).to eq('X')
        expect(board.board[4][3]).to eq('O')
      end

      it 'Stop if there are no available space' do
        6.times { board.update_board(3, 'X') }
        expect(board.update_board(3, 'X')).to eq('error')
      end
    end
  end

  describe '#horizontal_win' do
    context 'When a player has won' do
      it 'returns true for a horizontal win' do
        board.update_board(3, 'X')
        board.update_board(4, 'X')
        board.update_board(5, 'X')
        board.update_board(6, 'X')
        expect(board.horizontal_win).to eq(true)
      end

      it 'returns false otherwise' do
        board.update_board(3, 'X')
        expect(board.horizontal_win).to eq(false)
      end
    end
  end
end
