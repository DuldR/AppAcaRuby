def sum(n)

    if n == 1
        return 1
    elsif n < 1
        return nil
    end

    n + sum(n - 1)

end


def add_numbers(arr)

    if arr.length == 1
        return arr[0]
    elsif arr.empty? == true
        return nil
    end

    arr.pop + add_numbers(arr)

end

def gamma(n)

    if n == 1
        return 1
    elsif n == 0
        return nil
    end

    (n - 1) * gamma(n - 1)

end

def ics(arr, str)
    return false if arr.length == 0

    if (arr[0] == str) == false
        arr.shift
        ics(arr, str)
    else
        return true
    end
end

def rev(str)
    
end