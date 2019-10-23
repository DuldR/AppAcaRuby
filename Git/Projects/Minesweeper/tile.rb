class Tile

    def initialize(bomb)
        @tile = bomb

        if @tile == "O"
            @bomb = false
        else
            @bomb = true
        end

    end

    def show_tile
        @tile
    end


end