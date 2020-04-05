require_relative "card"
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

    def play

        until self.gameover?
            self.turn
        end

    end

    def turn
        # Ensure the players are ready.
        self.prep_status

        #Show the players their hands
        self.show_hands

        #Ask if they'd like to discard cards and then receive new ones
        self.discard_and_receive

        #Show the players their hands again
        self.show_hands

        #Ask for their bets
        self.place_bets

        #Loop here until both calls or one folds
        #That'll be the final step!

        until self.betting_over? == true
            print "Player 1, what's your move?"
            print "\n"
            @player1.move

            print "Player 2, what's your move?"
            print "\n"
            @player2.move
        end

        if self.check_status == false
            self.win?
        end
  

        #Empties the players hands and gives them 5 more cards. Will set a new deck every game.
        self.empty_and_receive

    end

    def discard_and_receive

        #Calls discard on the players hand and then re-deals cards from the deck instance variable back into their hand
        print "Player 1: "
        #IF THIS WORKS LOL
        @player1.receive(@deck.deal(@player1.discard?))

        print "Player 2: "
        @player2.receive(@deck.deal(@player2.discard?))

    end

    def empty_and_receive

        #Empties player's hands
        @player1.empty
        @player2.empty

        #Sets a new deck. "Shuffles the cards back in"
        @deck = Deck.new
        @deck.ready?
    
        #Five new cards from the new deck
        @player1.receive(@deck.deal(5))
        @player2.receive(@deck.deal(5))


    end

    def prep_status

        @player1.reset_status
        @player2.reset_status

    end

    def show_hands
        print "Here's Player 1's hand: "
        print_hand(@player1.player_hand.hand)
        print "\n"
        print "---------------------------------------"
        print "\n"
        print "Here's Player 2's hand: "
        print_hand(@player2.player_hand.hand)
        print "\n"
    end

    def print_hand(player_hand)

        player_hand.each.with_index do |card, i|
            print "\n"
            print "[" + (i + 1).to_s + "] "
            print card.face
            print " of "
            print card.suit
            print "s "
            print "\n"
        end

    end

    def betting_over?

        #If the player has called, folded or raised.
        # Call = 1, Fold = 2, Raise = 3

        if @player1.player_status == 1 && @player2.player_status == 1
            return true
        elsif @player1.player_status == 2 || @player2.player_status == 2
            return true
        else
            return false
        end

    end



    #This function should only take out from the players pot, deduct it from theirs and sum it together.
    def place_bets

        print "Player 1: "
        @total_pot += @player1.raise?

        print "Player 2: "
        @total_pot += @player2.raise?


    end

    #Checks if a player folded or not.
    def check_status

        if @player1.player_status == 2 && @player2.player_status == 2
            p "A Draw!"
            return true
        elsif @player1.player_status == 2
            p "Player 2 Wins!"
            return true
        elsif @player2.player_status == 2
            p "Player 1 Wins!"
            return true
        end

        return false

    end

    #Checks player hands rank against each other. Still need to fix high card and when pairs match each other.
    def win?

        if @player1.player_hand.hand_rank > @player2.player_hand.hand_rank
            p "Player 1 Wins!"
        elsif @player1.player_hand.hand_rank == @player2.player_hand.hand_rank
            p "A Draw!"
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

if $PROGRAM_NAME == __FILE__
  Game.new.play
end