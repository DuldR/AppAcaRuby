require_relative "deck"

class Hand_Poker
    attr_reader :deck
    attr_accessor :hand

    def initialize(dealt)
        @hand = dealt
    end

    def hand_rank

        rank = hand_pairs

        #This was used to ensure the correct ranks
        # if rank == 3
        #     return "Two Pair!"
        # elsif rank == 4
        #     return "3 of a Kind!"
        # elsif rank == 2
        #     return "A Pair!"
        # elsif rank == 8
        #     return "4 of a Kind!"
        # elsif rank == 5
        #     return "Straight!"
        # elsif rank == 6
        #     return "Flush!"
        # elsif rank == 7
        #     return "Full House!"
        # elsif rank == 9
        #     return "Straight Flush!"
        # elsif rank == 10
        #     return "Royal Flush!"
        # elsif rank == 1
        #     return "High Card!"
        # end

        rank

    end



    #Helper Methods

    #Going through uniq pairs and finding amount
    def hand_pairs
        faces, suits = hand_format
        face = []
        suit = []

        #This is counting PAIRS and is feeding an array of [1,1,1,1,1] to hand_score
        faces.uniq.each do |f|
            face << faces.count(f)
        end

        suits.uniq.each do |s|
            suit << suits.count(s)
        end

        #If there are no pairs, re map the face array
        if face == [1,1,1,1,1]
            face = faces.map do |x|
                if x == "Ace"
                    x = 1
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

    def five_con?(arr)
        return false unless arr.size == 5
        arr.each_cons(2).all? {|a, b| b == a + 1 }
    end

    #Checks score and returns a number based on pairs/straight/flush
    def hand_score(face, suit)

        face.sort!
        
        # If suits are the same
        if suit == [5]
            #If the faces are 10, Jack, Queen, King and Ace
            if face == [1,10,11,12,13]
                #RFlush
                return 10
            elsif five_con?(face)
                #SFlush
                return 9
            else
                #Flush
                return 6
            end
        else
            if face == [3,2] || face == [2,3]
                #FUll House
                return 7
            elsif face == [1,2,2] || face == [2,1,2] || face == [2,2,1]
                #Two Pair
                return 3
            elsif five_con?(face)
                #Straight
                return 5
            elsif face.uniq.length == 5
                #Pairs NO High card yet
                return 1
            elsif face.max == 4
                #4 of a kind
                return 8
            elsif face.max == 3
                #3 of a kind
                return 4
            elsif face.max == 2
                #A pair
                return 2
            end
        end

    end

end