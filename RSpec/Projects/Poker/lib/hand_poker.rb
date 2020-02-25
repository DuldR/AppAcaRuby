require_relative "deck"

class Hand_Poker
    attr_reader :deck
    attr_accessor :hand

    def initialize(dealt)

        @hand = dealt

    end

    def hand_rank
        if hand_pairs == 2
            return "2 of a Kind!"
        elsif hand_pairs == 3
            return "3 of a Kind!"
        elsif hand_pairs == 4
            return "4 of a Kind!"
        elsif hand_pairs == 5
            return "Full House!"
        end

    end

    def hand_pairs
        pairs = []
        score = []

        
        #Getting face value from card obj
        @hand.each do |card|
            if card.face.to_i == 0
                pairs << card.face
            else
                pairs << card.face.to_i
            end
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
            return 5
        else
            return score.max
        end

    end

end