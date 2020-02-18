require "card"

class Deck

    attr_reader :set, :deck

    def initialize
        @set = []
        @deck = []
    end

    def create_set
        # Loop through cards for this. Maybe set a card module?
        
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

    def shuffle

    end

end