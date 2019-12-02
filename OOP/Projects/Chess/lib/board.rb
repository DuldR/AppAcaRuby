require_relative "pieces/piece"

class Board

    attr_reader :rows

    def self.print_grid(tGrid)

        puts "  #{(0..8).to_a.join(" ")}"
        tGrid.each.with_index do |row, rdx|
            rGrid = []

            row.each.with_index do |item, idx|
                rGrid << tGrid[rdx][idx].show_tile
            end
            puts "#{rdx} #{rGrid.join(" ")}"

        end
    end

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

    def fill_grid

        @rows = Array.new(8) { Array.new(8) }
        # @rows = @rows.map.with_index do |row, idx|
        #     row.map do |pos|
        #         if idx == 0 || idx == 1 || idx == 6 || idx == 7
        #             pos = Piece.new
        #         else
        #             pos
        #         end
        #     end
        # end
    end

    def fill_back_row

    end

    def render
        Board.print_grid(@row)
    end


end




b = Board.new