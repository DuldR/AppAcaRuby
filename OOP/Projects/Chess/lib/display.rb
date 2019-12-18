require "colorize"
require_relative "cursor.rb"

class Display

    def initialize(board)
        @board = board
    end

    
    # Add the below to a display class
    def build_grid
        @board.rows.map.with_index do |row, rdx|
            row.map.with_index do |col, cdx|
                if (rdx.even? && cdx.even?) || (rdx.odd? && cdx.odd?) 
                    col = (col.to_s).colorize(:background => :blue)
                elsif (rdx.even? && cdx.odd?) || (rdx.odd? && cdx.even?)
                    col = (col.to_s).colorize(:background => :red)
                end 
            end
        end
    end



    def render
        system("clear")
        build_grid.each { |row| puts row.join }
    end
end