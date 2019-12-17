require_relative "piece"
require_relative "slideable"

class Rook < Piece

    include Slideable

    def symbol
        '♖'.colorize(color)
    end

    def move_dirs
        hor_and_ver
    end

end
