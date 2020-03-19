class Deck < Card

    attr_reader :set, :deck

    def initialize
        @set = []
        @deck = []
    end

    def create_set
        # Loop through cards for this. Maybe set a card module?
        
        # Numbers
        NUMBERS.each do |num|
            SUITS.each do |suit|
                @set << Card.new(num, suit)
            end
        end

        # Faces

        FACE_CARDS.each do |face|
            SUITS.each do |suit|
                @set << Card.new(face, suit)
            end
        end

        @set
    end

    def format_deck
        @set.each do |card|
            @deck << card.val?
        end
    end

    def shuffle
        @set.shuffle!
    end


    def deal(amount)
        dealt = []

        amount.times { dealt << @set.pop }

        dealt

    end

    #Private

    def ready?
        self.create_set
        self.shuffle
        self.format_deck
    end

    def render
        self.format_deck
        #Write method to show deck
        self.show_deck
    end

    #Test Hand Methods

    def full_house
        2.times { @set << Card.new(2, "Heart") }
        3.times { @set << Card.new(3, "Spade") }
    end

    def two_pair
        2.times { @set << Card.new(2, "Heart") }
        2.times { @set << Card.new(3, "Spade") }
        1.times { @set << Card.new(9, "Spade") }
    end

    def straight
        1.times { @set << Card.new("Jack", "Heart") }
        1.times { @set << Card.new(7, "Heart") }
        1.times { @set << Card.new(10, "Heart") }
        1.times { @set << Card.new(8, "Heart") }
        1.times { @set << Card.new(9, "Spade") }
    end

    def sflush
        1.times { @set << Card.new(7, "Heart") }
        1.times { @set << Card.new(8, "Heart") }
        1.times { @set << Card.new(10, "Heart") }
        1.times { @set << Card.new(9, "Heart") }
        1.times { @set << Card.new(6, "Heart") }
    end

    def rflush
        1.times { @set << Card.new("Jack", "Heart") }
        1.times { @set << Card.new("Ace", "Heart") }
        1.times { @set << Card.new(10, "Heart") }
        1.times { @set << Card.new("Queen", "Heart") }
        1.times { @set << Card.new("King", "Heart") }
    end

    def four
        1.times { @set << Card.new(3, "Heart") }
        4.times { @set << Card.new(2, "Club") }
    end

    def three
        1.times { @set << Card.new(3, "Heart") }
        3.times { @set << Card.new(2, "Club") }
        1.times { @set << Card.new(4, "Heart") }
    end

    def two_face
        2.times { @set << Card.new("Jack", "Heart") }
        1.times { @set << Card.new(2, "Heart") }
        1.times { @set << Card.new(3, "Club") }
        1.times { @set << Card.new(4, "Spade") }
    end

    def high
        1.times { @set << Card.new(5, "Diamond") }
        1.times { @set << Card.new(2, "Spade") }
        1.times { @set << Card.new(3, "Club") }
        1.times { @set << Card.new(4, "Heart") }
        1.times { @set << Card.new(7, "Heart") }
    end


end