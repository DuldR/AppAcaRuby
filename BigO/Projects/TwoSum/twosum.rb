arr = [0, 1, 5, 7]
# two_sum?(arr, 6) # => should be true
# two_sum?(arr, 10) # => should be false

brr = [0, 4, 6, 3, 1, 100, 30, 40, 20, 5]


#This is O(n^2). Nested loop.
def bad_two_sum?(arr, target)

    arr.each.with_index do |x, idx|
        arr.each.with_index do |y, idy|
            if idx == idy
                next
            else
                if (x + y) == target
                    return true
                end
            end
        end
    end

    return false

end

#This is O(n^2) due to the sort method being called INSIDE the method.
def okay_two_sum?(arr, target)
    arr.sort!

    lhs = 0
    rhs = arr.length - 1 

    while lhs < rhs
        total = arr[lhs] + arr[rhs]
        if total > target
            rhs -= 1
        elsif total < target
            lhs += 1
        elsif total == target
            return true
        end

    end

    return false
end


#O(n) time. 
def two_sum?(arr,target)
    chk = Hash.new

    arr.each do |x|
        chk[x] = x
    end

    chk.each do |k, v|
        miss = target - chk[k]
        if chk.has_key?(miss) && miss != k
            return true
        else
            next
        end
    end

    return false

end


p bad_two_sum?(arr, 6)
p bad_two_sum?(arr, 10)
print "\n"
p okay_two_sum?(brr, 130)
p okay_two_sum?(brr, 25)
print "\n"
p two_sum?(arr, 6) 
p two_sum?(brr, 999)