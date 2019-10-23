require "tile"

class Board

    attr_reader :grid


    def self.print_grid(tGrid)

        puts " #{(0..2).to_a.join(" ")}"
        tGrid.each.with_index do |row, rdx|
            rGrid = []

            row.each.with_index do |item, idx|
                rGrid << tGrid[rdx][idx].show_tile
            end
            puts rGrid.join(" ")

            # grid.each_with_index do |row, i|
            #   puts "#{i} #{row.join(" ")}"
            # end
        end
    end


    def initialize
        @grid = Array.new(3) { Array.new(3, "O") }
        @bombs = []
    end

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


    def render
        Board.print_grid(@grid)
    end

end

b = Board.new
b.fill_bombs