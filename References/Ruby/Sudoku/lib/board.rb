# class Board

#     def initialize
#         @grid = Array.new(4) { Array.new(4, 0) }
#     end




# end

def self.print_grid(tGrid)
    tGrid.each do |row|
        puts row.join(" ")
    end
end

grid = Array.new(4) { [] }
n = 0


Dir.chdir("D:/AppWork/RubyRedux/References/Ruby/Sudoku/puzzles")
File.open("sudoku1.txt").each.with_index do |row, rdx|
    row.chomp.chars.each.with_index do |item, idx|
        grid[rdx][idx] = item.to_i
    end
end

# File.open("sudoku1.txt").each do |row|
#     p row
# end

# newPuzz.each do |row|
#     p row
# end

# p Dir.pwd
# Dir.chdir("D:/AppWork/RubyRedux/References/Ruby/Sudoku/puzzles")
# p Dir.pwd

# D:/AppWork/RubyRedux/References/Ruby/Sudoku/puzzles