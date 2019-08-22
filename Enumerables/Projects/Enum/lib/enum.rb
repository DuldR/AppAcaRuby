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

