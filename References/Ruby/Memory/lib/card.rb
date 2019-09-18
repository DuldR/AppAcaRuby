class Card

    attr_reader :answer

    def initialize
        @answer = []
    end

    def get_move

        print "Enter the position: "

        user_input = gets.chomp

        @answer = user_input.split(" ").map(&:to_i)
        return @answer

    end

    def ret_ans
        @answer
    end

end
