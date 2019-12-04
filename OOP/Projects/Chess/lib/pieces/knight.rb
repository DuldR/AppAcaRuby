require_relative "piece"
require_relative "slideable"

class Knight < Piece

    include Stepable

    def symbol
        '♘'
    end

    def move_dirs
        knight
    end

end
