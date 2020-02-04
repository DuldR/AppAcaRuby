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

def stocks(arr)

    raise ArgumentError unless arr.is_a?(Array)
    sales = 0
    returnArr = [0, 0]
    
    arr.each_with_index do |price, day|
        arr.each_with_index do |diff, idx|
            if day >= idx
                next
            else
                if (price - diff) > sales
                    sales = price - diff
                    returnArr[0] = day
                    returnArr[1] = idx
                end
            end
        end
    
    end
    returnArr

end


class Hanoi

    attr_reader :board

    def initialize
        @board = Array.new(3) { Array.new([]) }
        @board[0] = [1,2,3]
    end

    def move
        user_input_tower

        #Utilize this method to take in user input, check for the disc then call output
        
    end

    def user_input_tower
        ans = 0
   
        until ans > 0 && ans <= 3
            puts "Enter a tower number(1,2 or 3): "
            chk = gets.to_i

            if @board[chk - 1].empty?
                puts "That's an empty tower."
                next
            else
                ans = chk
            end
        end

        ans
    end

    def user_output_tower(disc)
        #Use move to call this method an input disc
        

    end
    
end