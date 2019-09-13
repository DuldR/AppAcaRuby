class Board

    def initialize
        @grid = Array.new(5) { Array.new(5, " ") }
    end

    def print_grid
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def format_grid
        n = -1

        @grid.each do |row|
            row[0] = n
            n += 1
        end

        @grid[0] = [" ", 0, 1, 2, 3]
        return @grid
    end

    def num_pairs(n)
        @grid.flatten.count(n)
    end

    # Get and Set Position Methods

    def [](position) #Offset the position by 1 due to the legend
        pRow = position[0]
        pColumn = position[1]

        @grid[pRow + 1][pColumn + 1]
    end

    def []=(sPos, val) #Offset the user input by 1 due to the legend
        pRos = sPos[0]
        pColumn = sPos[1]
        @grid[pRos + 1][pColumn + 1] = val
    
    end

    def count_pairs
        @grid[1..-1].each do |row|
            if row[1..-1].count(" ") > 0
                return true
            else
                return false
            end
        end
    end

    def fill_pairs
        

    end



end