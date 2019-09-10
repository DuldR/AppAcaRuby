class Board

    def initialize
        @grid = Array.new(4) { Array.new(4, " ") }
    end

    def print_grid
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def format_grid
        @grid = ["", 0, 1, 2].zip(@grid)
        @grid[0][0] = [" ", 0, 1, 2]
        return @grid
    end
end