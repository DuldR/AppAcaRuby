module Slideable
    HORIZONTAL_AND_VERTICAL_DIRS = [
        [-1, 0],
        [0, -1],
        [0, 1],
        [1, 0]
    ].freeze
        
    DIAGONAL_DIRS = [
        [-1, -1],
        [-1, 1],
        [1, -1],
        [1, 1]
    ].freeze

    def hor_and_ver
        HORIZONTAL_AND_VERTICAL_DIRS
    end

    def diag
        DIAGONAL_DIRS
    end

    def moves
        moves = []

        move_dirs.each do |dx, dy|
            moves.concat(find_valid_moves(dx,dy))
        end

        moves
    end

    def move_dirs
        raise NotImplementedError
    end

    def find_valid_moves(dx, dy)
        cur_x, cur_y = pos
        moves = []

        loop do
            cur_x, cur_y = cur_x + dx, cur_y + dy
            pos = [cur_x, cur_y]

            break unless board.valid_pos?(pos)

            if board.empty?(pos)
                moves << pos
            else
                moves << pos if board[pos].color != color
                break
            end
        end

        moves
    end
end

