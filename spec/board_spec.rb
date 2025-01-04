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
    end
  end
end
