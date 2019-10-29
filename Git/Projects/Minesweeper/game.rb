require "board"

class MineGame

    def initialize
        @board = Board.new
        @board.fill_bombs
    end

    def run

        done = false

        until done == true
            @board.render
            @board.cheat_render

            puts "Enter a coordinate: "
            @board.turn
        end

    end

end