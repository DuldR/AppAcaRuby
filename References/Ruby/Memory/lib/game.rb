class Game

    attr_reader :board, :grid, :card

    def initialize
        @board = Board.new
        @card = Card.new
        @score = 0

    end

    def game_over?

        if win? == true
            return true
        else
            return false
        end

    end

    def win?

        if @score == 8
            p "You win!"
            @board.cheat
            return true
        else
            return false
        end
    end

    def start_game
        @board.format_grid
        @board.fill_pairs
    end

    def compare(ans) #Compares the board answers and if they match, modify the answer grid and reset. If not, reset to previous state.
        if @board[ans[0]] == @board[ans[1]]
            p "They match!"
            p "------------"
            @board.place(ans)
            @board.reset
            return true
        else
            p "Not a match. :("
            p "------------"
            @board.reset
            return false
        end
    end


    def turn
        answers = []

        p "Here's the grid: "
        @board.print_shown

        p "Pick a coord"
        while answers.length < 2 #ENsures two answers are given.
            if @board.show(@card.get_move) == true
                answers << @card.ret_ans
            else
                p "Pick another coord"
            end
            @board.print_shown
            p "------------------------------"
        end

        if self.compare(answers) == true
            @score += 1
        end
    end


end