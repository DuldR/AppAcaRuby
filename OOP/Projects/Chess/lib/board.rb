require_relative "pieces/piece"

class Board

    attr_reader :rows

    def initialize
        fill_grid
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def empty?(pos)
        self[pos].empty?
    end

    def valid_pos?(pos)
        x, y = pos

        if x < 0 || x > 8 || y < 0 || y > 8
            return false
        end

        return true

    end

    def move_piece(start_pos, end_pos)

        if self[start_pos].nil? == true || self[end_pos].nil? == false
            raise "Invalid starting position or ending position"
        end

        self[end_pos] = self[start_pos]
        self[start_pos] = nil

    end

    # Setting up board.

    def fill_grid

        @rows = Array.new(8) { Array.new(8) }

        fill_back_row
        test_rook
    end

    def fill_back_row
        @rows = @rows.map.with_index do |row,idx|
            row.map.with_index do |col, cdx|
                if idx == 0 || idx == 1
                    col = Piece.new(:black, self, [idx, cdx])
                elsif idx == 6 || idx == 7
                    col = Piece.new(:white, self, [idx, cdx])
                end
            end
        end

    end

    #Testing rook capability

    def test_rook
        @rows[1][0] = Rook.new(:black, self, [1,0])
    end

    # Add the below to a display class
    def build_grid
        @rows.map.with_index do |row, idx|
            row.map do |col|
                if col.nil? == false
                    col = col.color
                else
                    col = :x
                end
            end
        end
    end

    def render
        build_grid.each { |row| puts row.join }
    end

end




b = Board.new