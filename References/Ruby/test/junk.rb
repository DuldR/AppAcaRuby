grid = Array.new(5) { Array.new(5, " ") }

n = -1

grid.each do |row|
    row[0] = n
    n += 1
end

grid[0] = [" ", 0, 1, 2, 3]


def findIt(dirg)
    dirg[1..-1].each do |row|
        if row[1..-1].count(" ") > 0
            return true
        else
            return false
        end
    end
end

def fill_pairs(grid)

    

end


