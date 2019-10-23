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
        

    end

    # User Input

    def parse_input(string)
        string.split(",").map { |char| Integer(char) }
    end

    def turn
        user_input = parse_input(gets.chomp)
        if self[user_input] == "O"  #Calls upon the board object itself using the user input.
            neighbor_bombs?(user_input)
            self[user_input]
        else
            puts "You lose."
        end
    end


    def [](pos) #This acts on the Board object. Must call upon itself.
        x, y = pos
        @grid[x][y].reveal
    end


    # UI Management

    def render
        Board.print_grid(@grid)
    end

end
