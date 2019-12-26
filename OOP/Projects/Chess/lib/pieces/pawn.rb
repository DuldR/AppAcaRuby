require_relative "piece"


class Pawn < Piece
    
    attr_reader :symbol

    def symbol
        "♟".colorize(:color => color)
    end

    def move_dirs
        [[1,-1], [1, 1], [-1, 1], [-1, -1]]
    end

    def moves
        [forward_steps]
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
            else
                return []
            end
        elsif forward_dir == 1
            new_move = [pos[0] + 1, pos[1]]
            if board.empty?(new_move)
                return new_move
            else
                return []
            end
        end

    end

    def side_attacks
        moves = []

        if forward_dir == -1
            move_dirs[2..3].each do |chk|
                cur_x, cur_y = pos
                dx, dy = chk
                cur_x, cur_y = cur_x + dx, cur_y + dy
                new_move = [cur_x, cur_y]

                next unless board.valid_pos?(new_move)

                if board[new_move].color != color && board[new_move].color != :none
                    moves << new_move
                end
            end
        elsif forward_dir == 1
            move_dirs[0..1].each do |chk|
                cur_x, cur_y = pos
                dx, dy = chk
                cur_x, cur_y = cur_x + dx, cur_y + dy
                new_move = [cur_x, cur_y]

                next unless board.valid_pos?(new_move)

                if board[new_move].color != color && board[new_move].color != :none
                    moves << new_move
                end
            end
        end

        moves



    end

end

