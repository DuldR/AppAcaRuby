require "deck"

class Hand_Poker
    attr_reader :deck
    attr_accessor :hand

    def initialize(deck)

        @hand = []
        @deck = deck
    end


end