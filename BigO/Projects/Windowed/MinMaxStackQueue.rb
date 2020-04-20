require_relative 'MinMaxStack'


class MinMaxStackQueue

    def initialize
        @stack1 = MinMaxStack.new
        @stack2 = MinMaxStack.new
    end

    def empty?
        @stack1.empty? && @stack2.empty?
    end

    def size
        @stack1.size + @stack2.size
    end

    def enqueue(ele)
        @stack1.push(ele)
    end

    def dequeue
        queued if @stack2.empty?
        @stack2.pop
    end

    def queued
        @stack2.push(@stack1.pop) until @stack1.empty?
    end

    def max
    # At most two operations; O(1)
        maxes = []
        maxes << @stack1.max unless @stack1.empty?
        maxes << @stack2.max unless @stack2.empty?
        maxes.max
    end

    def min
        mins = []
        mins << @stack1.min unless @stack1.empty?
        mins << @stack2.min unless @stack2.empty?
        mins.min
    end
end