def upcase(str)
    return str.upcase if str.length <= 1
    puts str
    str[0].upcase + upcase(str[1..-1])

end

def it_upcase(str)

    str.chars.inject("") do |upcase, char|
        upcase << char.upcase
    end
end

def reverse(str)

    return str if str.length <= 1

    str[-1] + reverse(str[0..-2])

end

# "Hello" => "olleH"
# "Hell" => "o" + "lleH"

def quick_sort(arr)
    return arr if arr.length <= 1

    pivot_arr = [arr.first]
    left_side = arr[1..-1].select { |ele| ele < arr.first }
    right_side = arr[1..-1].select { |ele| ele >= arr.first }

    quick_sort(left_side) + pivot_arr + quick_sort(right_side)


end

def fac(n)
    return 1 if n <= 1
    p n
    n* fac(n-1)
end