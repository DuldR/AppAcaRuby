require_relative "piece"
require_relative "slideable"

class Rook < Piece

    include Slideable

    def symbol
        '♖'
    end

    def move_dirs
        hor_and_ver
    end

end