require_relative "deck"

class Hand_Poker
    attr_reader :deck
    attr_accessor :hand

    def initialize(dealt)

        @hand = dealt

        #Use this to check for sequentials. 
        @seq = [1,2,3,4,5,6,7,8,9,10,11,12,13,1,10,11,12,13]

    end

    def hand_rank
        if hand_pairs == 2
            return "2 of a Kind!"
        elsif hand_pairs == 3
            return "3 of a Kind!"
        elsif hand_pairs == 4
            return "4 of a Kind!"
        elsif hand_pairs == 5
            return "Straight!"
        elsif hand_pairs == 6
            return "Flush!"
        elsif hand_pairs == 7
            return "Full House!"
        elsif hand_pairs == 8
            return "Straight Flush!"
        elsif hand_pairs == 9
            return "Royal Flush!"
        end

    end



    #Helper Methods

    #Going through uniq pairs and finding amount
    def hand_pairs
        faces, suits = hand_format
        face = []
        suit = []

        faces.uniq.each do |f|
            face << faces.count(f)
        end

        suits.uniq.each do |s|
            suit << suits.count(s)
        end

        hand_score(face, suit)
    end

    #Converts hand to face/suit count for pair eval
    def hand_format
        face_count = [[],[]]

        @hand.each do |card|
            if card.face.to_i == 0
                face_count[0] << card.face
                face_count[1] << card.suit
            else
                face_count[0] << card.face.to_i
                face_count[1] << card.suit
            end
        end

        face_count
    end

    #Checks score and returns a number based on pairs/straight/flush
    def hand_score(face, suit)

        face_check = face.map do |x|
            if x == "Ace"
                x = 0
            elsif x == "Jack"
                x = 11
            elsif x == "Queen"
                x = 12
            elsif x == "King"
                x = 13
            else
                x
            end
        end

        face_check.sort!

        if face_check == [1,10,11,12,13]
            if suit == 5
                return 9
            else
                return 5
            end
        end


        # if face == [3,2] || face == [2,3]
        #     return 7
        # else
        #     return face.max
        # end

    end

    def five_con?(arr)
        return false unless arr.size == 4
        arr.each_cons(2).all? {|a, b| b == a + 1 }
    end

end