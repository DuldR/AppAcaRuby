class Card

    def get_move

        print "Enter the position"

        user_input = gets.chomp

        return user_input.split(" ").map(&:to_i)

    end

end

    # def initialize(grid, hgrid)
    #     @faceDown = ""
    #     @grid = grid
    #     @hGrid = hgrid
    # end

    # def hide(aPos)
    #     @faceDown[aPos] = " "
    # end
    
    # def reveal(arr) #Take in an array, and reveal grid value.
    #     return @grid[arr[0]][arr[1]]
    # end

    # def show(sPos)
    #     @grid[sPos] 
    # end
    
    # def fill(n) #test method to fill array
    #     @grid[0][0] = n
    # end

    # # Get and Set Position Methods

    # def [](position) #Offset the position by 1 due to the legend
    #     pRow = position[0]
    #     pColumn = position[1]

    #     @grid[pRow + 1][pColumn + 1]
    # end

    # def []=(sPos, val) #Offset the user input by 1 due to the legend
    #     pRos = sPos[0]
    #     pColumn = sPos[1]
    #     @grid[pRos + 1][pColumn + 1] = val
    
    # end
