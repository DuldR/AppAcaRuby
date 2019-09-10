require_relative "player"
require_relative "dictionary"
require_relative "fragment"

class Ghost

    attr_reader :Player
    
    def initialize(letter)
        @player = Player.new
        @fragment = Fragment.new(letter)
    end

    # def turn
    #     if @fragment
    # end
end
