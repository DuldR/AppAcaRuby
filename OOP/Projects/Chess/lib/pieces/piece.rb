class Piece

    attr_reader :color, :board
    attr_accessor :pos


    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def empty?
        false
    end

    def to_s
        " #{symbol} "
    end

    def symbol
        raise NotImplementedError
    end

    def valid_moves
        moves.reject { |end_pos| move_into_check?(end_pos) }
    end

    def move_into_check?(end_pos)
        test_board = board.dup
        test_board.move_piece!(pos, end_pos)
        test_board.in_check?(color)

    end


end
