require './lib/game'
require './lib/player'

describe Game do
  subject(:game_one) { described_class.new }
  let(:player_instance) { instance_double(Player, player1: 'X') }

  describe '#initialize' do
    context 'When game is initialize'
    before do
      allow(Player).to receive(:new).and_return(player_instance)
    end
    it 'returns current_player as X' do
      expect(game_one.currently_playing).to eq('X')
    end
  end
end
