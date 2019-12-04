module Stepable
    KING_DIR = [
        [-1, 0],
        [0, -1],
        [0, 1],
        [1, 0]
    ].freeze

    KNIGHT_DIR = [
        [-2, -1],
        [-1, -2],
        [-2, 1],
        [-1, 2],
        [1, 2],
        [2, 1],
        [2, -1,],
        [1, -2]
    ].freeze

    def king
        KING_DIR
    end

    def knight
        KNIGHT_DIR
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

            break if move_dirs == KING_DIR ||KNIGHT_DIR
        end

        moves

    end


end
