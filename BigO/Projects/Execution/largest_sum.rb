require 'benchmark'

list = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]
list4 = [1,2,-3,4,-5]

#O(n2) as the nested each loop will dominate
def largesum(arr)
    final = []

    arr.each.with_index do |a, idx|
        arr.each.with_index do |b, xdx|
            if arr[idx..xdx].empty?
                next
            else
                final << arr[idx..xdx]
            end
        end
    end

    final.map(&:sum).max


end

#O(n) only ONE loop
def largesum2(arr)
    large = arr.first
    curr = arr.first

    (1...arr.length).each do |i|
        curr = 0 if curr < 0
        curr += arr[i]
        large = curr if curr > large
    end

    large




end

p largesum2(list4)
# p largesum(list)
# p largesum(list2)
# p largesum(list3)