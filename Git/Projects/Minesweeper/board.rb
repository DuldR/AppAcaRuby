class Board

    attr_reader :grid


    def self.print_grid(tGrid)
        tGrid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize
        @grid = Array.new(3) { [] }
        @bombs = []

        4.times { @bombs << "X" }
        5.times { @bombs << "O" }
    end


    def fill_bombs

        pos = 0

        @grid.each.with_index do |foo, rdx|
            foo.each.with_index do |bar, cdx|
                puts "Hello"
            end
        end

            # @grid[rdx][pos] = @bombs[pos]
            # pos += 1
    end
end