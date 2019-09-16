class Junk

    attr_reader :grid

    def initialize
        @grid = Array.new(5) { Array.new(5, "1") }
    end

    def print

        print @grid
        
    end


    def [](position) #Finds position
        pRow = position[0]
        pColumn = position[1]

        @grid[pRow][pColumn]
    end


end

