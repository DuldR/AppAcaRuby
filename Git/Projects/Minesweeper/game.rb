require "board"

class MineGame

    def initialize
        @board = Board.new
        @board.fill_bombs
    end

    def run


        until @board.game_over? == true
            @board.render
            # @board.cheat_render

            puts "Enter a coordinate: "
            @board.turn
        end

    end

end