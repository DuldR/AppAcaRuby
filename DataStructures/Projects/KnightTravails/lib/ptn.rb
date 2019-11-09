class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []


    end

    def parent=(parent)

        self.parent.children.delete(self) if @parent.nil? == false

        @parent = parent



        if parent.nil? == false && self.parent.children.include?(self) == false 
            self.parent.children << self
        end

    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "3RR0R" if child_node.parent != self
        child_node.parent = nil
    end



    def bfs(target_value)

        queue = [self]

        until queue.empty?
            el = queue.shift

            return el if el.value == target_value

            el.children.each do |child|
                queue << child
            end
        end


    end

    def dfs(target = nil, &prc)
        raise "Need a proc or target" if [target, prc].none?
        prc ||= Proc.new { |node| node.value == target }

        return self if prc.call(self)

        children.each do |child|
            result = child.dfs(&prc)
            return result unless result.nil?
        end

        nil
    end


end
