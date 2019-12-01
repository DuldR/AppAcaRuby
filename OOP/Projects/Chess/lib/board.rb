class Board

    attr_reader :rows

    def initialize
        @rows = Array.new(8) { Array.new(8) }
        @rows = @rows.map.with_index do |row, idx|
            row.map do |pos|
                if idx == 0 || idx == 1 || idx == 6 || idx == 7
                    pos = Piece.new
                else
                    pos
                end
            end
        end
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def valid_pos?(pos)
        x, y = pos

        if x < 0 || x > 8 || y < 0 || y > 8
            return false
        end

        return true

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

b = Board.new