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


    # Don't test
    # THis pulls in the player input and feeds it into the discard function
    # Returns an array of answers
    def how_much?
        answers = []
        amount = 0

        until amount == 9
            begin
                amount = gets.chomp
                amount = Integer(amount)
                answers << amount
            rescue ArgumentError
                print "Please enter a number."
                retry
            end
        end

        answers.pop
        answers
    end


end