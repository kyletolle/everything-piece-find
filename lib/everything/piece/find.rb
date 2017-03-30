require 'everything'
require 'everything/piece/find/version'

module Everything
  class Piece
    module Find
      def find_by_name(piece_name)
        piece_path = File.join(Everything.path, piece_name)

        # TODO: Move no_piece & not_directory errors into Piece in the core?
        raise_no_piece_error(piece_name) unless File.exist?(piece_path)
        raise_not_directory_error(piece_name, piece_path) unless Dir.exist?(piece_path)

        Piece.new(piece_path)
      end

      def find_by_name_recursive(piece_name)
        glob_path = File.join(Everything.path, '**', piece_name)
        possible_dirs = Dir.glob(glob_path)
        full_piece_path = possible_dirs.first

        raise_no_piece_recursive_error(piece_name) unless full_piece_path
        raise_not_directory_error(piece_name, full_piece_path) unless Dir.exist?(full_piece_path)

        Piece.new(full_piece_path)
      end

    private

      def raise_no_piece_error(piece_name)
        error_message =
          %Q{Could not find directory for piece "#{piece_name}" in #{Everything.path}}

        raise ArgumentError, error_message
      end

      def raise_no_piece_recursive_error(piece_name)
        error_message =
          %Q{Could not find directory for piece "#{piece_name}" in #{Everything.path} or subdirectories}
        raise ArgumentError, error_message
      end

      def raise_not_directory_error(piece_name, piece_path)
        error_message =
          %Q{Found file at #{piece_path}, but was expecting a directory for piece "#{piece_name}"}
        raise ArgumentError, error_message
      end
    end
  end
end

require 'everything/piece/find/core_ext'
