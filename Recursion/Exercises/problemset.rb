
#Recursive Range

def range(nS, nE)

    if nS == nE
        return []
    elsif nE < nS
        return []
    end

    [nS] + range(nS + 1, nE)

end

#Iterative Range

def irange(nS, nE)

    retArr = []

    if nE < nS
        return []
    else
        while nS < nE
            retArr << nS
            nS += 1
        end
    end

    return retArr
end

#Recursion 1
def exp(base, ex)

    return 1 if ex == 0

    base * exp(base, ex - 1)
end

#Recursion 2
def exp2(base, ex)

    if ex == 2
        return base * 2
    elsif ex == 1
        return base
    end

    if ex.odd?
        base * exp2(base, (ex - 1) / 2) * exp2(base, (ex - 1) / 2)
    else
        exp2(base, (ex / 2)) * exp2(base, (ex / 2))
    end

end

#Deep Dupe #Wow, I did it.

def deep_dup(arr)

    return arr if arr.is_a?(Array) == false

    returnArr = []

    arr.each do |item|
        returnArr << deep_dup(item)
    end

    returnArr

end

#Fib Number

def fib(n)

    return 1 if n == 1 || n == 2

    fib(n-1) + fib(n-2)

end


def binary_search(array, key, low=0, high=array.size-1)  
    return nil if low > high  
    mid = (low + high) / 2  
    return mid if array[mid]==key  
    if array[mid] > key  
      high = mid - 1  
    else  
      low = mid + 1  
    end 

    binary_search(array, key, low, high)   
end   

def merge_sort(arr)

    #If the arr is 1 or 0, you've reached your base case.
    return arr if arr.length <= 1

    mid = arr.length / 2

    #Splitting the array in TWAIN
    # ... is used because you dont want to include mid nor the actual arr length.
    left_side = arr[0...mid]
    right_side = arr[mid...arr.length]

    #Merge calls the inductive step.
    merge(merge_sort(left_side), merge_sort(right_side))

end

def merge(left, right)
    sorted = []

    #Sorts the arrays till you're empty.
    until left.empty? || right.empty?
        if left.first > right.first
            sorted << right.shift
        else
            sorted << left.shift
        end
    end

    #You must add the sorted and remaining arrays together.
    #This ensures you've sorted it correctly.
    sorted + left + right

end

def subset(arr)


    return [[]] if arr.empty?

    # Will take [1] and return [] thus compelting the base case.
    set = subset(arr[0...-1])

    #This takes the return array, [[]] and MAPS it with the given array's last element.
    # You then ADD that mapped array with concate to the original array.
    # [[]] + [[]].map with x += array last.
    # Array = [1]
    # [[]] + [[]].map - x += 1 == [[], [1]] and so on.
    set.concat(set.map { |x| x += [arr.last] })

end

def perm(arr) #I don't know.
    return [arr] if arr.length < 2

    arr.flat_map do |ele|
        perm(arr - [ele]).map do |per|
            ([ele] + per)
        end
    end
end

# def make_change(amount, coins)

#     if amount == 0
#         return [0]
#     elsif amount < 0
#         return [-1]
#     else
#         return [coins[0]]
#     end

#     change = []

#     total = make_change((amount - coins[0]), coins)


# end

def add_it(amount, counter) #I'm out of ideas.

    return [] if amount <= 0 || counter[0] > amount

    total = []

    counter.each do |ele|
        total += (add_it(amount-ele, [ele]) + [ele])
    end

    total

end