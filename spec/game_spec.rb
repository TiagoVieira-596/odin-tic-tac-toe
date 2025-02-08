require_relative '../game'
describe Game do
  describe '#initialize' do
    let(:board) { described_class.new(0, 0, '-') }
    it 'updates the board with that piece' do
      expect { described_class.new(0, 0, 'x') }.to change {
                                                     Game.board_pieces
                                                   }.to([%w[x - -], %w[- - -], %w[- - -]])
    end
  end

  describe '#board_pieces' do
    it 'returns the board pieces' do
      expect(Game.board_pieces).to eq([%w[x - -], %w[- - -], %w[- - -]])
    end
  end

  describe '#check_victory_lines' do
    context "returns x when there's a victory of x" do
      it 'reads the first row' do
        expect(CheckVictory.check_victory_lines([%w[x x x], %w[- - -], %w[- - -]])).to eq('x')
      end
      it 'reads the second row' do
        expect(CheckVictory.check_victory_lines([%w[- - -], %w[x x x], %w[- - -]])).to eq('x')
      end
      it 'reads the third row' do
        expect(CheckVictory.check_victory_lines([%w[- - -], %w[- - -], %w[x x x]])).to eq('x')
      end
      it 'reads the first column' do
        expect(CheckVictory.check_victory_lines([%w[x - -], %w[x - -], %w[x - -]])).to eq('x')
      end
      it 'reads the second column' do
        expect(CheckVictory.check_victory_lines([%w[- x -], %w[- x -], %w[- x -]])).to eq('x')
      end
      it 'reads the third column' do
        expect(CheckVictory.check_victory_lines([%w[- - x], %w[- - x], %w[- - x]])).to eq('x')
      end
    end
    context "returns o when there's a victory of o" do
      it 'reads the first row' do
        expect(CheckVictory.check_victory_lines([%w[o o o], %w[- - -], %w[- - -]])).to eq('o')
      end
      it 'reads the second row' do
        expect(CheckVictory.check_victory_lines([%w[- - -], %w[o o o], %w[- - -]])).to eq('o')
      end
      it 'reads the third row' do
        expect(CheckVictory.check_victory_lines([%w[- - -], %w[- - -], %w[o o o]])).to eq('o')
      end
      it 'reads the first column' do
        expect(CheckVictory.check_victory_lines([%w[o - -], %w[o - -], %w[o - -]])).to eq('o')
      end
      it 'reads the second column' do
        expect(CheckVictory.check_victory_lines([%w[- o -], %w[- o -], %w[- o -]])).to eq('o')
      end
      it 'reads the third column' do
        expect(CheckVictory.check_victory_lines([%w[- - o], %w[- - o], %w[- - o]])).to eq('o')
      end
    end
    it 'returns false when no one won' do
        expect(CheckVictory.check_victory_lines([%w[- - o], %w[- - o], %w[- - x]])).to eq(false)
    end
  end

  describe '#check_victory_cross' do
    context "returns x when there's a victory of x" do
      it 'reads the first diagonal' do
        expect(CheckVictory.check_victory_cross([%w[x - -], %w[- x -], %w[- - x]])).to eq('x')
      end
      it 'reads the second diagonal' do
        expect(CheckVictory.check_victory_cross([%w[- - x], %w[- x -], %w[x - -]])).to eq('x')
      end
    end
    context "returns o when there's a victory of o" do
      it 'reads the first diagonal' do
        expect(CheckVictory.check_victory_cross([%w[o - -], %w[- o -], %w[- - o]])).to eq('o')
      end
      it 'reads the second diagonal' do
        expect(CheckVictory.check_victory_cross([%w[- - o], %w[- o -], %w[o - -]])).to eq('o')
      end
    end
    it 'returns false when no one won' do
        expect(CheckVictory.check_victory_cross([%w[- - o], %w[- - o], %w[- - x]])).to eq(false)
    end
  end
end
