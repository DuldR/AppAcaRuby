arr = [0, 1, 5, 7]
# two_sum?(arr, 6) # => should be true
# two_sum?(arr, 10) # => should be false



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

p bad_two_sum?(arr, 6)
p bad_two_sum?(arr, 10)