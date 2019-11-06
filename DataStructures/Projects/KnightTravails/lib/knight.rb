class KnightPathFinder

    def self.valid_moves(pos)

        x, y = pos
        movesR = []
    
        rows = [-2, 2]
        cols = [-1, 1]
    
        rows.each do |row|
            cols.each do |col|
                movesR << [x+row, y+col]
                movesR << [x+col, y+row]
            end
        end
    
        return movesR.select.with_index do |arr, idx|
            arr if arr.all? { |item| item < 8 && item > 0 }
        end
    
    end

    def initialize(pos)
        @root = pos
        @considered_positions = []

    end

    def new_move_positions(pos)
        new_moves = []

        self.valid_moves(pos).each do |p|
            if @considered_positions.include?(p)
                next
            else
                new_moves << p
                @considered_positions << p
            end
        end

        new_moves
    end


end




