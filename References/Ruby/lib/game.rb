class Game

    attr_reader :board, :grid, :card

    def initialize
        @board = Board.new
        @card = Card.new

    end

    def game_over?
        puts "Ready to play?"
        user_input = gets.chomp

        if user_input == "yes"
            return false
        else
            return true
        end

    end

    def start_game
        @board.format_grid
        @board.fill_pairs
    end


    def turn
        p "Here's the grid: "
        @board.print

        p "Pick a coord"
        @board.show(@card.get_move)
    end


end