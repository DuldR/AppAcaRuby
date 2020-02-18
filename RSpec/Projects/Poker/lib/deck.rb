require "card"

class Deck

    attr_reader :set

    def initialize
        @set = []
    end

    def create_set
        until @set.length == 52
            @set << Card.new("Ace", "Spade")
        end

        @set
    end

    def format_deck

    end

end