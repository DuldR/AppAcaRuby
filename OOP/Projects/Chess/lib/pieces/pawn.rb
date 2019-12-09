require_relative "piece"


class Pawn < Piece

    def symbol
        '♙'
    end

    def move_dirs
        [[1,0],
        [-1,0],
        [1,-1],
        [1, 1],
        [-1, 1],
        [-1, -1]]
    end
    

    def forward_dir
        if color == :white
            return 1
        else
            return -1
        end
    end


    def at_start_row?
        if color == :white && pos[0] == 6
            return true
        elsif color == :black && pos[0] == 1
            return true
        else
            return false
        end
    end

    def side_attacks
        cur_x, cur_y = pos
        moves = []

        # loop do
        #     cur_x, cur_y = cur_x + dx, cur_y + dy
        #     pos = [cur_x, cur_y]

        #     break unless board.valid_pos?(pos)

        #     if board.empty?(pos)
        #         moves << pos
        #     else
        #         moves << pos if board[pos].color != color
        #         break
        #     end
        # end

        if color == :white


        moves
    end

end
