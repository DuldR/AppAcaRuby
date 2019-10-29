require "tile"

class Board

    attr_reader :grid


    def self.print_grid(tGrid)

        puts "  #{(0..2).to_a.join(" ")}"
        tGrid.each.with_index do |row, rdx|
            rGrid = []

            row.each.with_index do |item, idx|
                rGrid << tGrid[rdx][idx].show_tile
            end
            puts "#{rdx} #{rGrid.join(" ")}"

        end
    end

    def self.print_grid_cheat(tGrid)

        puts "  #{(0..2).to_a.join(" ")}"
        tGrid.each.with_index do |row, rdx|
            rGrid = []

            row.each.with_index do |item, idx|
                rGrid << tGrid[rdx][idx].cheat
            end
            puts "#{rdx} #{rGrid.join(" ")}"

        end
    end


    def initialize
        @grid = Array.new(3) { Array.new(3, "O") }
        @bombs = []
    end

    # Preparing grid with random bombs

    def prep_bombs
        4.times { @bombs << "X" }
        5.times { @bombs << "O" }
        @bombs = @bombs.shuffle
    end

    def fill_bombs
        pos = 0
        prep_bombs

        @grid.each.with_index do |foo, rdx|
            foo.each.with_index do |bar, cdx|
                @grid[rdx][cdx] = Tile.new(@bombs[pos])
                pos += 1
            end
        end
    end

    # Reveal Algorithm

    def neighbor_bombs?(pos)

        checkArr= []
        colArr = []

        rowChecks = (pos[1]-1..pos[1]+1).to_a
        colChecks = (pos[0]-1..pos[0]+1).to_a

        rowChecks.each.with_index do |row, idx|
            checkArr << [pos[0], rowChecks[idx]]
        end

        rowChecks.each.with_index do |row, idx|
            checkArr << [colChecks[idx], pos[1],]
        end

        checkArr
    end

    def valid_space_check?(check)

        returnArr = []

        check.each.with_index do |item, idx|
            if item.any? { |i| i < 0 }
                next
            else
                returnArr << check[idx]
            end
        end

        returnArr

    end

    def reveal_spaces(pos)

        neighborArr = neighbor_bombs?(pos)
        neighborArr = valid_space_check?(neighborArr)


        neighborArr.each do |pos|
            print pos
        end
    end
        

    # User Input

    def parse_input(string)
        string.split(",").map { |char| Integer(char) }
    end

    def turn
        user_input = parse_input(gets.chomp)

        if self[user_input].tile_ans == "O"  #Calls upon the board object itself using the user input.
            puts "Reveal"
            reveal_spaces(user_input)
            puts "Set"
            self[user_input].reveal
        else
            puts "You lose."
        end
    end


    def [](pos) #This acts on the Board object. Must call upon itself.
        x, y = pos
        @grid[x][y]
    end


    # UI Management

    def render
        Board.print_grid(@grid)
    end

    def cheat_render
        Board.print_grid_cheat(@grid)
    end

end

b = MineGame.new
b.run