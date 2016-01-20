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

    let(:given_piece_name) { 'super-duper' }
    it 'returns a piece' do
      expect(finder.find_by_name('super-duper')).to be_a(Everything::Piece)
    end

    it 'returns the piece with that name' do
      actual_piece = finder.find_by_name('super-duper')

      actual_piece_basename = File.basename(actual_piece.full_path)
      expect(actual_piece_basename).to eq(given_piece_name)
    end
  end

  context '#find_path_for_piece_name' do
    include_context 'with stubbed everything path'

    let(:given_piece_name) do
      'seconds-away-from-you'
    end
    let(:expected_piece_path) do
      '/everything/repo/seconds-away-from-you'
    end
    let(:actual_piece_path) do
      finder.find_path_for_piece_name(given_piece_name)
    end

    it 'returns path for the piece' do
      expect(actual_piece_path).to eq(expected_piece_path)
    end
  end
end
