#  [1, 2, 1, 3, 3].uniq # => [1, 2, 3]

def my_uniq(arr)
    raise ArgumentError unless arr.is_a?(Array)
    returnArr = []

    arr.each do |x|
        if returnArr.include?(x)
            next
        else
            returnArr << x
        end
    end

    returnArr

end

def my_transpose(arr)
    raise ArgumentError unless arr.is_a?(Array)
    col = Array.new(arr.length) { Array.new(arr.length, 0) }

    arr.each_with_index do |row, rdx|
        row.each_with_index do |cl, cdx|
            col[cdx][rdx] = cl
        end
    end

    col

end

def add(arr)
    return [arr[0] + arr[1]]
end