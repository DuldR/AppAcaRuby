require_relative "player"
require_relative "dictionary"
require_relative "fragment"

class Ghost

    attr_reader :player, :fragment
    
    def initialize
        @player = Player.new
        @fragment = Fragment.new(@player.getAnswer)
    end

    def lose?
        if @fragment.anyMore? == false
            print
            print "You lose"
            return true
        else
            return false
        end
    end

    def game_over?
        if lose? == true
            return true
        else
            return false
        end
    end

    def turn
        @fragment.checkDict(@player.getAnswer)

    end
end
