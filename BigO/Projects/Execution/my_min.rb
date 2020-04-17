require 'benchmark'

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

#This is O(n)
def my_min(arr)
    least = arr[0]

    arr.each do |i|
        if i < least
            least = i
        end
    end

    least
end

#This will be O(n2)

def my_min_2(arr)
    least = arr[0]

    arr.each do |i|
        arr.each do |y|
            if i < y && i < least
                least = i
            end
        end
    end

    least


end


puts "my_min"
puts "\n"
puts Benchmark.measure { my_min(list) }
puts "\n"
puts "secondary"
puts Benchmark.measure { my_min_2(list) }