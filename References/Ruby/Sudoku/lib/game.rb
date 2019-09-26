class Game

    def initialize
        @board = Board.new
        @board.make_grid
    end

    def game_over?
        return @board.solved?
    end


    def turn
        answers = []

        p "Here's the grid: "
        @board.render_grid

        while answers.length < 2 #Ensures two answers are given.
            if @board.valid_answer?(@board.get_pos) == true
                answers << @board.pos
                answers << @board.get_ans
            else
                p "That's not a valid option. Choose again."
            end
        end

        p answers
        @board.ans_tile(answers)
        
        @board.render_grid
    end
end