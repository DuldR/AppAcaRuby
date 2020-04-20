class MyQueue

    def initialize(store = [])
        @store = store
    end

    def enqueue(ele)
        @store << ele
    end

    def dequeue
        @store.shift
    end
    
    #Solution has this as LAST element. But a queue is FIFO. Therefore, the next element in a queue would be the first one.
    def peek
        @store[0]
    end

    def size
        @store.size
    end

    def empty?
        @store.empty?
    end


end