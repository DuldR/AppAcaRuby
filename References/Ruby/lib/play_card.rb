require_relative "game"
require_relative "board"

memory = Game.new

until memory.game_over? do

    memory.turn

end