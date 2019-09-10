class Game

    attr_reader :grid, :board

    def initialize
        @board = Board.new
        @board.format_grid
    end

    def game_over?
        puts "End?"
        user_input = gets.chomp

        if user_input == "yes"
            return true
        else
            return false
        end

    end


    def turn
        p "Here's the grid: "
        @board.print_grid
    end


end