require_relative 'MyStack'


class StackQueue

    def initialize
        @stack1 = MyStack.new
        @stack2 = MyStack.new
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
        queued if @stack.empty?
        @stack2.pop
    end

    def queued
        @stack2.push(@stack1.pop) until @stack1.empty?
    end
end