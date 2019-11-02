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


end

node1 = PolyTreeNode.new("root")
node2 = PolyTreeNode.new("child1")
node3 = PolyTreeNode.new("child2")