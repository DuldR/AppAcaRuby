class MyStack

    def initialize(store = [])
        @store = []
    
    end

    def push(ele)
        @store.push(ele)
    end

    def pop
        @store.pop
    end
    
    def peek
        @store[-1]
    end

    def size
        @store.size
    end

    def empty?
        @store.empty?
    end


end