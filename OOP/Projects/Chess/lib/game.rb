require_relative "board"
require_relative "display"


class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
  end

  def run
    until 1 == 2
        @display.render
        @display.cursor.get_input
    end
  end

end
