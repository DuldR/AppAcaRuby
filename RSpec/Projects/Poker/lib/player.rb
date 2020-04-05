require_relative "hand_poker"


class Player

    attr_reader :player_hand, :pot, :player_status


    def initialize(hand)
        @player_hand = hand
        @pot = 20

        #If the player has called, folded or raised.
        # Call = 1, Fold = 2, Raise = 3
        @player_status = 0
    end

    # Allow discard to take in an array and test that. Keep your private method as a user input
    def discard(arr)
        raise "Not a valid input." unless arr.is_a?(Array) && arr.length < 6

        arr.each do |card|
            @player_hand.hand[card - 1] = 0
        end

        @player_hand.hand.reject! { |card| card == 0 }

    end

    def discard?
        print "How much would you like to discard? Enter card numbers seperated by a comma: "

        disc = gets.chomp
        disc = disc.split(",").map(&:to_i)
        

        if disc.include?(0)
            print "No cards chosen!"
            return 0
        else
            discard(disc)
        end

        return disc.length

    end

    #Receive Pot Amount

    #Receive Cards
    def receive(deckArr)

        deckArr.each do |card|
            @player_hand.hand << card
        end

    end


    # Allow user to bet amount from their pot
    def bet(amount)

        @pot -= amount

        amount

    end

    # Flush player cards for new game.

    def empty
        @player_hand.hand = []
    end

    def reset_status
        @player_status = 0
    end

    def move

        answer = self.how_much_move?

        if answer == "F"
            @player_status = 2
        elsif answer == "R"
            self.raise?
            @player_status = 3
        elsif answer == "S"
            @player_status = 1
        end

    end

    #Set the player hand to empty if they fold.
    # Removed this method

    #This will take in the game last bet deduct from the users pot accordingly
    def see(match)

        if match > @pot
            bet(@pot)
        end
        
        bet(match)
    end

    #This will wask the user how much they'd like to bet.
    def raise?
        bet(self.how_much_pot?)
    end

    # Don't test
    # THis pulls in the player input and feeds it into the discard function
    # Returns an array of answers
    def how_much_cards?
        answers = []
        amount = 0
    
        until amount == 9
            print "Which cards would you like to discard?(1,2,3,4 or 5)? Enter 9 to end. "
            print "\n"
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
            print "\n"
            begin
                amount = gets.chomp
                amount = Integer(amount)

                if amount > @pot
                    amount = 0
                    print "You can't bet more than you have."
                    print "\n"
                end

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
            print "\n"
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