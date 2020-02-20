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

        @hand.each do |card|
            if card.face.to_i == 0
                next
            else
                pairs << card.face.to_i
            end

            pairs.sort
        end



        # if pairs.uniq.length == 2
        #     pairs.uniq.each do |i|
        #         score << pairs.count(i)
        #     end

        #     if score.include?(3) && score.include?(2)
        #         return "Full house!"
        #     end


        # pairs.each do |pair|

        #     if pairs.count(pair) == 4
        #         return 4
        #     elsif pairs.count(pair) == 3
        #         return 3
        #     elsif pairs.count(pair) == 2
        #         return 2
        #     else
        #         next
        #     end
        # end 

    end

end