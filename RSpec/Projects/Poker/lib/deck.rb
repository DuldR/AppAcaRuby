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

end