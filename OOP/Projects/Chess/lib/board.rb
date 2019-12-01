class Board

    attr_reader :rows

    def initialize
        @rows = Array.new(8) { Array.new(8) }
        @rows = @rows.map.with_index do |p, idx|
            p.map do |pos|
                if idx == 0 || idx == 1
                    pos = Piece.new
                else
                    pos
                end
            end
        end
    end

end


class Piece

    # def initialize(color, board, pos)
    #     @color = color
    #     @board = board
    #     @pos = pos
    # end

    def initialize
    end

end