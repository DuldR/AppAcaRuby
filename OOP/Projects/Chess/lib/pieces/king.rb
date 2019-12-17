require_relative "piece"
require_relative "stepable"

class King < Piece

    include Stepable

    def symbol
        '♔'.colorize(color)
    end

    def move_dirs
        king
    end

end
