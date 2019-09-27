class Tile

    def initialize(n)
        @tile = n

        if @tile > 0
            @ans = true
        else
            @ans = false
        end

    end

    def given?
        return @ans
    end

    def show_tile
        @tile
    end

    def set_tile(newAns)

        if given? == true
            p "You can't change that tile."
        else
            @tile = newAns
        end

    end
    

end