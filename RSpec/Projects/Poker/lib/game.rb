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

    def discard_and_receive

        #Calls discard on the players hand and then re-deals cards from the deck instance variable back into their hand
        print "Player 1: "
        #IF THIS WORKS LOL
        @player1.receive(@deck.deal(@player1.discard?))

        print "Player 2: "
        @player2.receiver(@deck.deal(@player2.discard?))

    end

    def place_bets
        #This function should only take out from the players pot, deduct it from theirs and sum it together.


        print "Player 1: "
        @total_pot += @player1.raise?

        print "Player 2: "
        @total_pot += @player2.raise?


    end

    def win?
        if @player1.player_hand.hand_rank > @player2.player_hand.hand_rank
            p "Player 1 Wins!"
        else
            p "Player 2 Wins!"
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