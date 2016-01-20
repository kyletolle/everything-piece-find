describe Everything::Piece::Find do
  it 'has a version number' do
    expect(Everything::Piece::Find::VERSION).not_to be nil
  end

  let(:fake_class) do
    class FakeClass
      include Everything::Piece::Find
    end
  end
  let(:finder) do
    fake_class.new
  end

  shared_context 'with stubbed everything path' do
    let(:expected_everything_path) do
      '/everything/repo'
    end

    before do
      allow(Everything).to receive(:path).and_return(expected_everything_path)
    end
  end

  context '#find_by_name' do
    include_context 'with stubbed everything path'

    let(:given_piece_name) do
      'seconds-away-from-you'
    end
    let(:actual_piece) do
      finder.find_by_name(given_piece_name)
    end
    it 'returns a piece' do
      expect(actual_piece).to be_a(Everything::Piece)
    end

    let(:expected_piece_path) do
      '/everything/repo/seconds-away-from-you'
    end
    it 'returns the piece from the repo root' do
      expect(actual_piece.full_path).to eq(expected_piece_path)
    end
  end
end
