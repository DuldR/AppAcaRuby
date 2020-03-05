require_relative "hand_poker"
require_relative "deck"


class Player

    attr_reader :player_hand, :pot


    def initialize(hand)
        @player_hand = hand
        @pot = 20
    end


end