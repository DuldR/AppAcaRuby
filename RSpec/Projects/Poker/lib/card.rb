class Card

    NUMBERS = [2,3,4,5,6,7,8,9,10]
    FACE_CARDS = ["Jack", "Queen", "King", "Ace"]
    SUITS = ["Spade", "Heart", "Diamond", "Club"]

    attr_reader :face, :suit

    def initialize(face, suit)
        
        if SUITS.include?(suit)
            @suit = suit
        else
            raise "That's not a suit"
        end

        if NUMBERS.include?(face.to_i) || FACE_CARDS.include?(face)
            @face = face
        else
            raise "That's not a face"
        end

    end

    def val?
        "#{@face} of #{@suit}s"
    end



end