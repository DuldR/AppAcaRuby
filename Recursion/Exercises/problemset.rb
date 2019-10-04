
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

# def bin(arr, n)
#     value = []

#     if arr[0] != n
#         value << 
#     else
#         value << bin(arr[1..-1], n)
#     end

# end


# def bin(arr, n)
#     value = 0

#     if arr[0] == n
#         return 0
#     elsif arr.length == 0
#         return 1
#     else
#         value = (1 + bin(arr[1..-1], n))
#     end

#     return value
# end

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