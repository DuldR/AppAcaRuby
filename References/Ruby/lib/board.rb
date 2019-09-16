class Board

    def self.print_grid(tGrid)
        tGrid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize
        @grid = Array.new(5) { Array.new(5, " ") }
        @hGrid = []
        @sGrid = []
        @anwers = []
    end

    # Grid Setup

    def format_grid
        n = -1

        @grid.each do |row|
            row[0] = n
            n += 1
        end

        @grid[0] = [" ", 0, 1, 2, 3]

        @sGrid = @grid.clone.map(&:clone)
        @hGrid = @grid.clone.map(&:clone)
    end

    def num_pairs(n) #May not need this.
        @grid.flatten.count(n)
    end

    def count_pairs #May not need this.
        @grid[1..-1].each do |row|
            if row[1..-1].count(" ") > 0
                return true
            else
                return false
            end
        end
    end

    def fill_pairs
        n = 0
        fillArr = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8]
        fillArr = fillArr.shuffle

        @grid[1..-1].each do |row|
            row[1..-1].each.with_index(1) do |item, idx|
                row[idx] = fillArr[n]
                n += 1
            end
        end
    end

    # Get and Set Position Methods

    def [](position) #Offset the position by 1 due to the legend
        pRow = position[0]
        pColumn = position[1]

        @sGrid[pRow + 1][pColumn + 1]
    end

    def []=(sPos, val) #Offset the user input by 1 due to the legend
        pRos = sPos[0]
        pColumn = sPos[1]
        @sGrid[pRos + 1][pColumn + 1] = val
    
    end


    # Grid Manipulation

    def show(pPos)

        cRow = pPos[0]
        cColumn = pPos[1]
        if valid?(pPos) == true
            self[pPos] = @grid[cRow + 1][cColumn + 1]
            return true
        else
            p "That's not a valid answer"
            return false
        end
    end

    def valid?(pPos) #Checks for valid answer
        if self[pPos] == " "
            return true
        else
            return false
        end
    end

    def reset
        @sGrid = @hGrid.clone.map(&:clone)
    end


    # Printing the various grids

    def print_shown #prints shown grid
        Board.print_grid(@sGrid)
    end

    def print #prints FAKEASS grid
        Board.print_grid(@hGrid)
    end

    def cheat #prints real grid
        Board.print_grid(@grid)
    end

end