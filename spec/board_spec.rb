require './lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#initialize' do
    context 'when board class is initialized' do
      it 'create an array of 42 elements' do
        expect(board.board).to be_an_instance_of(Array)
        expect(board.board.size).to eq(42)
      end
    end
  end
end
