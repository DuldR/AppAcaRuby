require_relative "deck"

class Hand_Poker
    attr_reader :deck
    attr_accessor :hand

    def initialize(dealt)

        @hand = dealt

    end

    def hand_rank


    end

    def hand_pairs
        pairs = []
        score = []

        
        #Getting face value from card obj
        @hand.each do |card|
            if card.face.to_i == 0
                next
            else
                pairs << card.face.to_i
            end

            pairs.sort
        end

        #Going through uniq pairs and finding amount
        pairs.uniq.each do |pair|
            if pair == 0
                next
            else
                score << pairs.count(pair)
            end
        end

        #Logic for fullhouse"
        if score == [3,2] || score == [2,3]
            return [5]
        else
            return score.max
        end

    end

end