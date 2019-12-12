require "colorize"

class Display

    def initialize(board)
        @board = board
    end

    
    # Add the below to a display class
    def build_grid
        @board.rows.map.with_index do |row, rdx|
            row.map.with_index do |col, cdx|
                if (rdx.even? && cdx.even?) || (rdx.odd? && cdx.odd?) 
                    col = col.symbol.colorize(:background => :black)
                elsif (rdx.even? && cdx.odd?) || (rdx.odd? && cdx.even?)
                    col = col.symbol.colorize(:background => :white)
                end 
            end
        end
    end

    def render
        build_grid.each { |row| puts row.join }
    end
end