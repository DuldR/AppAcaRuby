class Card

    attr_reader :face, :suit

    def initialize(face, suit)
        numbers = [2,3,4,5,6,7,8,9,10]
        face_cards = ["Jack", "Queen", "King", "Ace"]
        suits = ["Spade", "Heart", "Diamond", "Club"]

        
        if suits.include?(suit)
            @suit = suit
        else
            raise "That's not a suit"
        end

        if numbers.include?(face.to_i) || face_cards.include?(face)
            @face = face
        else
            raise "That's not a face"
        end

    end



end