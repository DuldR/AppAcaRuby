require_relative "ptn"

class KnightPathFinder

    attr_accessor :root_node

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

    def build_move_tree
        self.root_node = PolyTreeNode.new(@root)

        queue = [root_node]

        until queue.empty?
            node = queue.shift
            current_pos = node.value
            new_move_positions(current_pos).each do |pos|
                next_node = PolyTreeNode.new(pos)
                node.add_child(next_node)
                queue << next_node
            end
        end

    end

    def new_move_positions(pos)
        new_moves = []

        KnightPathFinder.valid_moves(pos).each do |p|
            if @considered_positions.include?(p)
                next
            else
                new_moves << p
                @considered_positions << p
            end
        end

        new_moves
    end

    def find_path(end_pos)
        trace_path_back(@root_node.bfs(end_pos))
    end

    def trace_path_back(tgt)
        path_arr = [tgt.value]
        final_node = tgt

        until final_node == @root_node
            final_node = final_node.parent
            path_arr << final_node.value
        end

        return path_arr.reverse

    end


end


b = KnightPathFinder.new([0,0])
b.build_move_tree
b.find_path([7,6])
b.find_path([6,2])



