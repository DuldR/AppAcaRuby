class Board

    attr_reader :grid, :pos

    def self.print_grid(tGrid)
        tGrid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize
        @grid = Array.new(4) { [] }
        @rGrid = Array.new(4) { [] }
        @gridL = @grid.length
    end

    #Grid initialization


    def make_grid #Reading puzzle from file

        Dir.chdir("D:/AppWork/RubyRedux/References/Ruby/Sudoku/puzzles")

        File.open("sudoku1solved.txt").each.with_index do |row, rdx|
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


    def ans_tile(lPos)

        cRow, cColumn = lPos[0]
        userAns = lPos[1][0]

        @grid[cRow][cColumn].set_tile(userAns)
       
    end




    # Get and Set Position Methods

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
        return @rGrid.all? { |row| row.sum == 10 }
    end

    def check_col
        n = 0
        colArr = Array.new(@gridL) { [] }

        while n < @gridL
            @rGrid.each.with_index do |col, idx|
                colArr[n] << @rGrid[idx][n]
            end
            n += 1
        end

        return colArr.all? { |col| col.sum == 10 }

    end

    def solved?

        if check_row && check_col == true
            return true
        else
            return false
        end

    end

end
