def valid_moves(pos)

    x, y = pos
    moves = []
    movesR = []

    rows = [-2, 2]
    cols = [-1, 1]

    rows.each do |row|
        cols.each do |col|
            movesR << [x+row, y+col]
            movesR << [x+col, y+row]
        end
    end

    moves = movesR.clone

    movesR.each do |i|
        moves << i.reverse
    end

    return moves.select.with_index do |arr, idx|
        arr if arr.all? { |item| item < 8 && item > 0 }
    end

end

def out_of_bounds?(arr)

    arr.each do |item|
        return true if item > 7 || item < 0
    end

end

def select_test(arr)

end

valid_moves([6,7])