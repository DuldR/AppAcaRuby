require_relative "game"
require_relative "board"
require_relative "tile"

sudoku = Game.new

until sudoku.game_over? do

    sudoku.turn

end