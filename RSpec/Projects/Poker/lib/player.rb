require_relative "hand_poker"
require_relative "deck"


class Player

    attr_reader :player_hand, :pot


    def initialize(hand)
        @player_hand = hand
        @pot = 20
    end

    def discard?
        p "How many would you like to discard?: "

        amount = gets.chomp

        @player_hand.hand[amount].pop


    end


end