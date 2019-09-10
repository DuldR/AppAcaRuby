class Card

    def initialize
        @faceDown = ""
        @grid = Array.new(3) { Array.new(3, "") }
    end

    def hide
        return @faceDown
    end
    
    def reveal(arr) #Take in an array, and reveal grid value.
        return @grid[arr[0]][arr[1]]
    end

    def show
        return @grid
    end
    
    def fill(n) #test method to fill array
        @grid[0][0] = n
    end


end