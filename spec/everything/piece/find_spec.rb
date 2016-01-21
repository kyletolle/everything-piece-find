describe Everything::Piece::Find do
  it 'has a version number' do
    expect(Everything::Piece::Find::VERSION).not_to be nil
  end

  let(:fake_class) do
    class FakeClass
      extend Everything::Piece::Find
    end
  end
  let(:finder) do
    fake_class
  end

  shared_context 'with stubbed everything path' do
    let(:expected_everything_path) do
      Dir.tmpdir
    end

    before do
      allow(Everything).to receive(:path).and_return(expected_everything_path)
    end
  end

  context '.find_by_name' do
    include_context 'with stubbed everything path'

    context 'where the directory does not exist' do
      let(:given_piece_name) { 'wont-exist' }
      let(:expected_error_message) do
        %Q{Could not find directory for piece "#{given_piece_name}" in #{Everything.path}}
      end

      it 'raises an ArgumentError' do
        expect { finder.find_by_name(given_piece_name) }
          .to raise_error(ArgumentError, expected_error_message)
      end
    end

    context 'where a file with that name exists, but it is not a directory' do
      let(:tmp_piece_path) do
        Tempfile.new('just-a-file-not-a-dir').path
      end
      let(:given_piece_name) do
        File.basename tmp_piece_path
      end
      let(:expected_error_message) do
        %Q{Found file at #{tmp_piece_path}, but was expecting a directory for piece "#{given_piece_name}"}
      end

      before do
        tmp_piece_path
      end

      it 'returns an ArgumentError' do
        expect { finder.find_by_name(given_piece_name) }
          .to raise_error(ArgumentError, expected_error_message)
      end
    end

    context 'where the directory exists' do
      let(:tmp_piece_path) do
        Dir.mktmpdir
      end
      let(:given_piece_name) do
        File.basename tmp_piece_path
      end

      after do
        FileUtils.remove_entry tmp_piece_path
      end

      let(:actual_piece) do
        finder.find_by_name(given_piece_name)
      end
      let(:expected_piece_path) do
        tmp_piece_path
      end

      it 'returns a piece' do
        expect(actual_piece).to be_a(Everything::Piece)
      end

      it 'returns the piece from the repo root' do
        expect(actual_piece.full_path).to eq(expected_piece_path)
      end
    end
  end

  describe '.find_by_name_recursive' do
    include_context 'with stubbed everything path'

    context 'where the directory does not exist' do
      let(:given_piece_name) { 'wont-exist' }
      let(:expected_error_message) do
        %Q{Could not find directory for piece "#{given_piece_name}" in #{Everything.path} or subdirectories}
      end

      it 'raises an ArgumentError' do
        expect { finder.find_by_name_recursive(given_piece_name) }
          .to raise_error(ArgumentError, expected_error_message)
      end
    end

    context 'where a file with that name exists, but it is not a directory' do
      let(:tmp_sub_dir) do
        Dir.mktmpdir
      end
      let(:tmp_piece_path) do
        Tempfile.new('just-a-file-under-sub-dir', tmp_sub_dir).path
      end
      let(:given_piece_name) do
        File.basename tmp_piece_path
      end
      let(:expected_error_message) do
        %Q{Found file at #{tmp_piece_path}, but was expecting a directory for piece "#{given_piece_name}"}
      end

      before do
        tmp_piece_path
      end

      after do
        FileUtils.remove_entry tmp_sub_dir
      end

      it 'returns an ArgumentError' do
        expect { finder.find_by_name_recursive(given_piece_name) }
          .to raise_error(ArgumentError, expected_error_message)
      end
    end

    context 'where one directory with that name exists' do
      let(:tmp_sub_dir) do
        Dir.mktmpdir
      end
      let(:given_piece_name) do
        'piece-under-sub-dir'
      end
      let(:tmp_piece_path) do
        File.join(tmp_sub_dir, given_piece_name)
      end

      before do
        tmp_sub_dir
        Dir.mkdir(tmp_piece_path)
      end

      after do
        FileUtils.remove_entry tmp_sub_dir
      end

      let(:actual_piece) do
        finder.find_by_name_recursive(given_piece_name)
      end
      let(:expected_piece_path) do
        tmp_piece_path
      end

      it 'returns a piece' do
        expect(actual_piece).to be_a(Everything::Piece)
      end

      it 'returns the piece from the sub directory' do
        expect(actual_piece.full_path).to eq(expected_piece_path)
      end
    end

    context 'where multiple directories of the same name exist' do
      let(:first_tmp_sub_dir) do
        Dir.mktmpdir
      end
      let(:given_piece_name) do
        'piece-under-sub-dir'
      end
      let(:first_tmp_piece_path) do
        File.join(first_tmp_sub_dir, given_piece_name)
      end
      let(:second_tmp_sub_dir) do
        Dir.mktmpdir
      end
      let(:second_tmp_piece_path) do
        File.join(second_tmp_sub_dir, given_piece_name)
      end

      before do
        first_tmp_sub_dir
        Dir.mkdir(first_tmp_piece_path)

        second_tmp_sub_dir
        Dir.mkdir(second_tmp_piece_path)
      end

      after do
        FileUtils.remove_entry first_tmp_sub_dir
        FileUtils.remove_entry second_tmp_sub_dir
      end

      let(:actual_piece) do
        finder.find_by_name_recursive(given_piece_name)
      end
      let(:first_piece_path_ordered_by_name) do
        [first_tmp_piece_path, second_tmp_piece_path].sort.first
      end
      let(:expected_piece_path) do
        first_piece_path_ordered_by_name
      end

      it 'returns a piece' do
        expect(actual_piece).to be_a(Everything::Piece)
      end

      it 'returns the piece from the first subdirectory found on disk' do
        expect(actual_piece.full_path).to eq(expected_piece_path)
      end
    end
  end
end
