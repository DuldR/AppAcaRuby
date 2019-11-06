class KnightPathFinder


    def initialize(pos)
        @root = pos

    end

    def valid_moves(pos)

        x, y = pos
        moves = []
        movesR = []
    
        [-1,1].each do |item|
            movesR << [x+2, y+item]
            movesR << [x-2, y+item]
        end
    
        moves = movesR.clone
    
        movesR.each do |i|
            moves << i.reverse
        end
    
        return moves
    end



end




