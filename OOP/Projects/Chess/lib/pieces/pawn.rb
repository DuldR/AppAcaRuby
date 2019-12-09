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

    def moves
        forward_steps
    end
    

    def forward_dir
        if color == :white
            return -1
        else
            return 1
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

    def forward_steps

        if forward_dir == -1
            new_move = [pos[0] - 1, pos[1]]
            if board.empty?(new_move)
                return new_move
            end
        else
            new_move = [pos[0] + 1, pos[1]]
            if board.empty?(new_move)
                return new_move
            end
        end

    end

    # def side_attacks
    #     cur_x, cur_y = pos
    #     moves = []


    #     if color == :white
    #         move_dirs[2,3].each do |chk|
    #             dx, dy = chk
    #             cur_x, cur_y = cur_x + dx, cur_y + dy
    #             pos = cur_x, cur_y
                
    #             break unless board.valid_pos(pos)

    #             if board[pos].color != color
    #                 moves << pos
    #             end
    #         end
    #     elsif color == :black
    #         move_dirs[4,5].each do |chk|
    #             dx, dy = chk
    #             cur_x, cur_y = cur_x + dx, cur_y + dy
    #             pos = cur_x, cur_y

    #             break unless board.valid_pos(pos)

    #             if board[pos].color != color
    #                 moves << pos
    #             end
    #         end
    #     end


    #     moves
    # end

end

d = Pawn.new(:black, Board.new, [5,0])
