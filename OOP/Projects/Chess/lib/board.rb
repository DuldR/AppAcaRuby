require_relative "pieces"

class Board

    attr_accessor :rows

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

    def dup
        new_dup = self.class.new
        duped_rows = rows.map(&:dup)
        new_dup.rows = duped_rows

        return new_dup
        
    end

    # Check and Checkmate Methods
    # Check Logic Move Methods

    def test_check
        self.move_piece([6,5], [5,5])
        self.move_piece([1,4], [2,4])
        self.move_piece([6,7], [4,7])
        self.move_piece([0,3], [4,7])
    end


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
                    puts "You're in check fam."
                    return true
                else
                    next
                end
            end
        end

        puts "You're not in check."
        return false

    end

    def in_check?(color)

        king_pos = find_king(color)
        check_moves(king_pos, color)

    end

    def checkmate?(color)
        
        king_pos = find_king(color)

        if king_pos.valid_moves.empty?
            return true
        else
            return false
        end

    end

    # Logic Methods

    def move_piece(start_pos, end_pos)

        piece = self[start_pos]

        if self[start_pos] == @null
            raise "This is not a valid starting position"
        end

        if self[start_pos].moves.include?(end_pos)
            self[end_pos] = piece
            self[start_pos] = @null
            piece.pos = end_pos
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
