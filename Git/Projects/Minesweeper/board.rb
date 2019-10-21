class Board

    attr_reader :grid


    def self.print_grid(tGrid)
        tGrid.each do |row|
            puts row.join(" ")
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
                @grid[rdx][cdx] = @bombs[pos]
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