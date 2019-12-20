require "colorize"
require_relative "cursor.rb"

class Display

    attr_reader :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], @board)
    end

    def build_grid
        @board.rows.map.with_index do |row, i|
            build_row(row, i)
        end
    end

    def build_row(row, i)
        row.map.with_index do |piece, j|
            color_options = colors_for(i, j)
            piece.to_s.colorize(color_options)
        end
    end

    def colors_for(i, j)
        if [i, j] == @cursor.cursor_pos
            bg = :yellow
        elsif (i + j).odd?
            bg = :red
        else
            bg = :blue
        end
        { background: bg }
    end

    def render
        system("clear")
        build_grid.each { |row| puts row.join }
    end
end