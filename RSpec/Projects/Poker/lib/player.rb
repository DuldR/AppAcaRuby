require_relative "hand_poker"
require_relative "deck"


class Player

    attr_reader :player_hand, :pot


    def initialize(hand)
        @player_hand = hand
        @pot = 20
    end

    # Allow discard to take in an array and test that. Keep your private method as a user input
    def discard(arr)
        raise "Not a valid input." unless arr.is_a?(Array) && arr.length < 6

        arr.each do |card|
            @player_hand.delete_at(card - 1)
        end
    end


    # Allow user to bet amount from their pot
    def bet(amount)
        raise "You don't have enough to bet that amount." if amount > @pot

        bet_amount = @pot -= amount

        bet_amount
    end

    def move(answer)
        if answer == "F"
            self.fold
        elsif answer == "R"
            self.raise?
        elsif answer == "S"
            self.see
        else
            raise "Not a valid answer. Please enter F, R or S"
        end

    end

    def fold

    end

    # Don't test
    # THis pulls in the player input and feeds it into the discard function
    # Returns an array of answers
    def how_much_cards?
        answers = []
        amount = 0
    
        until amount == 9
            print "Which cards would you like to discard?(1,2,3,4 or 5?): "
            begin
                amount = gets.chomp
                amount = Integer(amount)
                answers << amount
            rescue ArgumentError
                print "Please enter a number."
                print "\n"
                retry
            end
        end

        answers.pop
        answers
    end

    #User input for the pot amount
    def how_much_pot?
        amount = 0

        until amount > 0
            print "Please enter how much you'd like to bet."
            begin
                amount = gets.chomp
                amount = Integer(amount)
            rescue ArgumentError
                print "Please enter a number."
                print "\n"
                retry
            end
        end

        amount
    end

    #User input for if he raises, sees or folds
    def how_much_move?

        answer = nil

        until answer != nil
            print "Please enter (F)old, (R)aise, (S)ee."
            answer = gets.chomp

            if answer == "F" || answer == "S" || answer == "R"
                return answer
            else
                print "That's not a viable answer."
                print "\n"
                answer = nil
            end
        end
    end

end