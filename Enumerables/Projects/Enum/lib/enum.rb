class Array

    def my_each(&prc)
        n = 0
        while n < self.length
            prc.call(self[n])
            n += 1
        end
    end

    def my_select(&prc)
        returnArr = []

        self.my_each do |ele|
            if prc.call(ele) == true
                returnArr << ele
            else
                next
            end
        end

        returnArr
    end

    def my_reject(&prc)
        returnArr = []

        self.my_each do |ele|
            if prc.call(ele) == true
                next
            else
                returnArr << ele
            end
        end

        returnArr
    end

    def my_any?(&prc)

        self.my_each do |ele|
            if prc.call(ele) == true
                return true
            end
        end
        return false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            if prc.call(ele) == false
                return false
            end
        end
        return true
    end
        
end

def my_flatten(arr)
    return [arr] if arr.kind_of?(Array) == false

    returnArr = []

    arr.each do |ele|

        returnArr += my_flatten(ele)
    end

    returnArr
end

def my_zip(*args)
    returnArr = Array.new(self.length) { Array.new(args.length + 1) }

    self.each.with_index do |ele, idx|
        returnArr[idx][0] = ele
    end

    n = 1

    args.each do |ele2|
        m = 0
        ele2.each.with_index do |ele3, idx2|
            if idx2 >= self.length
                next
            else
                returnArr[m][n] = ele3
                m += 1
            end
        end
        n += 1
    end

    returnArr
end

def my_join(spc = "")
    returnStr = ""

    self.each do |ele|
        returnStr += (ele + spc)
    end

    returnStr

end

def my_reverse
    n = (self.length - 1)
    revArr = []

    while n >= 0
        revArr << self[n]
        n -= 1
    end

    revArr

end

