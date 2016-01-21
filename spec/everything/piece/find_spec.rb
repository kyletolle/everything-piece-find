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

    context 'where the directory does not exist' do
      before do
        allow(Dir)
          .to receive(:exists?)
          .and_return(false)
      end

      let(:expected_error_message) do
        %Q{No piece "#{given_piece_name}" found in "#{Everything.path}"}
      end

      it 'raises an ArgumentError error' do
        expect { finder.find_by_name(given_piece_name) }
          .to raise_error(ArgumentError, expected_error_message)
      end
    end

    context 'where the directory exists' do
      before do
        allow(Dir)
          .to receive(:exists?)
          .and_return(true)
      end

      let(:actual_piece) do
        finder.find_by_name(given_piece_name)
      end
      let(:expected_piece_path) do
        '/everything/repo/seconds-away-from-you'
      end

      it 'returns a piece' do
        expect(actual_piece).to be_a(Everything::Piece)
      end

      it 'returns the piece from the repo root' do
        expect(actual_piece.full_path).to eq(expected_piece_path)
      end
    end

  end
end
