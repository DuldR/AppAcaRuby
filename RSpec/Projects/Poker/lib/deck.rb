require "card"

class Deck

    attr_reader :set

    def initialize
        @set = []
    end

    def create_set
        @set = ["Card"]
    end

end