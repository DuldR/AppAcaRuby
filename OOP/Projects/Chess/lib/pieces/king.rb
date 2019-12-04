require_relative "piece"
require_relative "slideable"

class King < Piece

    include Stepable

    def symbol
        '♔'
    end

    def move_dirs
        king
    end

end
