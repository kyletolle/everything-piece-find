require 'everything'
require 'everything/piece/find/version'

module Everything
  class Piece
    module Find
      def find_by_name(piece_name)
        piece_path = File.join(Everything.path, piece_name)
        Piece.new(piece_path)
      end
    end
  end
end

require 'everything/piece/find/core_ext'
