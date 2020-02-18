require "card"

class Deck

    attr_reader :set, :deck

    def initialize
        @set = []
        @deck = []
    end

    def create_set
        until @set.length == 52
            @set << Card.new("Ace", "Spade")
        end

        @set
    end

    def format_deck
        @set.each do |card|
            @deck << card.val?
        end
    end

end