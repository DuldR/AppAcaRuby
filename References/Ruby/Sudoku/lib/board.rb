class Board

    attr_reader :grid, :pos

    def self.print_grid(tGrid)
        tGrid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize

        # Pulls in scaleable sudoku grid value.
        gridSet = []

        Dir.chdir("D:/AppWork/RubyRedux/References/Ruby/Sudoku/puzzles")

        File.open("sudoku1_almost.txt").each do |row|
            gridSet << row
        end

        @gridL = gridSet.length
        @grid = Array.new(@gridL) { [] }
        @rGrid = Array.new(@gridL) { [] }

    end

    #Grid initialization


    def make_grid #Reading puzzle from file

        Dir.chdir("D:/AppWork/RubyRedux/References/Ruby/Sudoku/puzzles")

        File.open("sudoku1_almost.txt").each.with_index do |row, rdx|
            row.chomp.chars.each.with_index do |item, idx|
                @grid[rdx][idx] = Tile.new(item.to_i)
            end
        end
    end

    def render_grid #Formats the play grid accessing the tile objects.

        @grid.each.with_index do |baz, rdx|
            baz.each.with_index do |item, idx|
                @rGrid[rdx][idx] = item.show_tile
            end
        end

        Board.print_grid(@rGrid)

    end

    # Grid manipulation


    def ans_tile(lPos) #Utilizes user input and checks to see if position is valid. If true, set to user given ans.

        cRow, cColumn = lPos[0]
        userAns = lPos[1][0]

        @grid[cRow][cColumn].set_tile(userAns)
       
    end




    # Get and Set Position Methods I'm not sure if I need these?

    def [](position)

        pRow, pColumn = position
        @grid[pRow][pColumn]

    end

    def []=(sPos, val) 
        pRow, pColumn = sPos
        @grid[pRow][pColumn] = val
    
    end

    # Player interaction

    def get_pos

        print "Enter the position: "

        user_input = gets.chomp
        @pos = user_input.split(" ").map(&:to_i)

    end

    def get_ans

        print "Enter the answer: "

        user_input = gets.chomp
        @ans = user_input.split(" ").map(&:to_i)
        
        return @ans
    end

    def valid_answer?(pos)
        
        cRow, cColumn = pos

        return !@grid[cRow][cColumn].given?

    end



    # Checking solved condition

    def check_row
        return @rGrid.all? { |row| row.sum == 45 }
    end

    def check_col #Makes new array set from columns. Then checks all column sum to provide solved answer.
        n = 0
        colArr = Array.new(@gridL) { [] }

        while n < @gridL
            @rGrid.each.with_index do |col, idx|
                colArr[n] << @rGrid[idx][n]
            end
            n += 1
        end

        return colArr.all? { |col| col.sum == 45 }

    end

    def solved?

        if check_row && check_col == true
            p "You win!"
            return true
        else
            return false
        end

    end

end
