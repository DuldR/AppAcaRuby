#O(n^2). Gross. Min and max are enumerables causing a nested loop.
def naive(arr, w)
    current_max_range = [0,0]
    wamount = arr.length - (w - 1)

    wamount.times do |x|
        min = arr[x..(x+(w-1))].min
        max = arr[x..(x+(w-1))].max

        if (max - min) > (current_max_range.max - current_max_range.min)
            current_max_range = arr[x..(x+(w-1))]
        end

    end

    p current_max_range
end



naive([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
naive([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
naive([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
naive([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8