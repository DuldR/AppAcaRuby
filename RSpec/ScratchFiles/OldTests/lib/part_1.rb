def average(num1, num2)

    check = (num1.to_f + num2) / 2

    if check % 1 != 0
        return check
    else
        return check.round(half: :down)
    end

end

def average_array(arr)

    avg = arr.inject { |acc, ele| acc + ele }


    return avg.to_f / arr.length
end


def repeat(str, num)

    returnStr = ""
    num.times do
        returnStr << str
    end

    returnStr

end

def yell(strY)


end

def alternating_case(strA)
    returnArr = []

    strA.split(" ").each_with_index do |ele, idx|

        if idx.even? == true
            returnArr << ele.upcase
        else
            returnArr << ele.downcase
        end

    end

    returnArr.join(" ")

end


def my_uniq(arr)
    raise ArgumentError unless arr.is_a?(Array)
end