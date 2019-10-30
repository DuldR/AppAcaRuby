require "tile"

class Board

    attr_reader :grid


    def self.print_grid(tGrid)

        puts "  #{(0..8).to_a.join(" ")}"
        tGrid.each.with_index do |row, rdx|
            rGrid = []

            row.each.with_index do |item, idx|
                rGrid << tGrid[rdx][idx].show_tile
            end
            puts "#{rdx} #{rGrid.join(" ")}"

        end
    end

    def self.print_grid_cheat(tGrid)

        puts "  #{(0..8).to_a.join(" ")}"
        tGrid.each.with_index do |row, rdx|
            rGrid = []

            row.each.with_index do |item, idx|
                rGrid << tGrid[rdx][idx].tile_ans
            end
            puts "#{rdx} #{rGrid.join(" ")}"

        end
    end


    def initialize
        @grid = Array.new(9) { Array.new(9, "O") }
        @bombs = []
        @lose = false
    end

    # Win/Lose Criteria

    def game_over?
        if @lose == true
            return true
        else
            return false
        end
    end

    def lose?
        @lose = true
    end

    # Preparing grid with random bombs

    def prep_bombs
        10.times { @bombs << "X" }
        71.times { @bombs << "O" }
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

        colChecks = (pos[1]-1..pos[1]+1).to_a
        rowChecks = (pos[0]-1..pos[0]+1).to_a

        # rowChecks.each.with_index do |row, idx|
        #     checkArr << [pos[0], rowChecks[idx]]
        # end

        rowChecks.each do |row|
            colChecks.each do |col|
                checkArr << [row, col]
            end
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
            if self[pos].tile_ans == "O"
                self[pos].reveal
            else
                next
            end
        end
    end
        

    # User Input

    def parse_input(string)
        string.split(",").map { |char| Integer(char) }
    end

    def turn
        user_input = parse_input(gets.chomp)

        if self[user_input].check_ans == true
            puts "You can't pick a revealed spot."
        elsif self[user_input].tile_ans == "O"  #Calls upon the board object itself using the user input.
            reveal_spaces(user_input)
            self[user_input].reveal
        else
            puts "You lose."
            self.cheat_render
            lose?
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