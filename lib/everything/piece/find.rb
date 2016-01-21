require 'everything'
require 'everything/piece/find/version'

module Everything
  class Piece
    module Find
      def find_by_name(piece_name)
        piece_path = File.join(Everything.path, piece_name)

        if Dir.exists?(piece_path)
          Piece.new(piece_path)

        else
          error_message =
            %Q{No piece "#{piece_name}" found in "#{Everything.path}"}

          raise ArgumentError, error_message
        end
      end
    end
  end
end

require 'everything/piece/find/core_ext'
