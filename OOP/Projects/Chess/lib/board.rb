require_relative "pieces"

class Board

    attr_reader :rows

    def initialize
        @null = NullPiece.instance
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

        if x < 0 || x > 7 || y < 0 || y > 7
            return false
        end


        return true

    end

    # Check and Checkmate Methods

    def find_king(color)
        # There's a better way to write this
        self.rows.each.with_index do |row, rdx|
            row.each.with_index do |col, cdx|
                if col.is_a?(King) && col.color == color
                    return col.pos
                else
                    next
                end
            end
        end


    end


    def check_moves(target_pos, color)

        self.rows.each do |row|
            row.each do |col|
                if col.color != color && col.moves.include?(target_pos)
                    puts "You're in check"
                else
                    next
                end
            end
        end

    end

    def in_check?(color)

        king_pos = find_king(color)
        check_moves(king_pos, color)

    end

    # Logic Methods

    def move_piece(start_pos, end_pos)

        if self[start_pos] == @null
            raise "This is not a valid starting position"
        end

        if self[start_pos].moves.include?(end_pos)
            self[end_pos] = self[start_pos]
            self[start_pos] = @null
        else
            raise "That's not a valid move"
        end

    end

    # Setting up board.

    def fill_grid

        @rows = Array.new(8) { Array.new(8, @null) }

        fill_back_row
        fill_pawns
 
    end

    # THese two methods can be combined

    def fill_back_row
        set_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

        @rows = @rows.map.with_index do |row,idx|
            row.map.with_index do |col, cdx|
                if idx == 0
                    col = set_pieces[cdx].new(:black, self, [idx, cdx])
                elsif idx == 7
                    col = set_pieces[cdx].new(:white, self, [idx, cdx])
                else
                    col
                end
            end
        end

    end

    def fill_pawns
        @rows = @rows.map.with_index do |row,idx|
            row.map.with_index do |col, cdx|
                if idx == 6
                    col = Pawn.new(:white, self, [idx, cdx])
                elsif idx == 1
                    col = Pawn.new(:black, self, [idx, cdx])
                else
                    col
                end
            end
        end
    end



end
