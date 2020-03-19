require_relative "deck"
require_relative "player"
require_relative "hand_poker"


class Game

    attr_reader :deck, :player1, :player2, :total_pot

    def initialize
        @total_pot = 0
        @deck = Deck.new
        @deck.ready?
        @player1 = Player.new(Hand_Poker.new(@deck.deal(5)))
        @player2 = Player.new(Hand_Poker.new(@deck.deal(5)))
        @current_turn = 1
    end

    def turn

    end

    def bigpot

    end

    def win?
        if @player1.player_hand.hand_rank > @player2.player_hand.hand_rank
            return 1
        else
            return 2
        end
    end

    def lose?(player)
        if player.pot == 0
            return true
        else
            return false
        end
    
    end

    def gameover?
        if lose?(@player1) || lose?(@player2)
            return true
        else
            return false
        end
    end


end