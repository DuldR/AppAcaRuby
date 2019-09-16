require_relative "game"
require_relative "board"
require_relative "card"

memory = Game.new
memory.start_game

until memory.game_over? do

    memory.turn

end