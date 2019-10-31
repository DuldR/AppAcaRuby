class Queue
    def initialize
      # create ivar to store stack here!
      @ivar = []

    end

    def enqueue(el)
      # adds an element to the stack
      @ivar = [el] + @ivar
    end

    def dequeue
      # removes one element from the stack
      @ivar = @ivar[0...-1]
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @ivar[-1]
    end
  end