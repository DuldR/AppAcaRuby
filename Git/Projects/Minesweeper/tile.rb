class Tile

    def initialize(n)
        @tile = n
        @ans = false

        if @tile == "O"
            @bomb = false
        else
            @bomb = true
        end


    end

    def show_tile

        if @ans == false
            return "*"
        else
            return @tile
        end
        
    end

    def check_ans
        @ans
    end

    def reveal
        @ans = true
    end

    def tile_ans
        @tile
    end

end