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

    # User Input

    def turn
        user_input = gets.chomp
        @grid[user_input]
    end

    #TODO
    # UserInput.split(",").map { |char| Integer(char) }
    # Maps user input into usable array

    def [](pos)
        x, y = pos
        @grid[x][y].reveal
    end


    # UI Management

    def render
        Board.print_grid(@grid)
    end

end

b = Board.new
b.fill_bombs