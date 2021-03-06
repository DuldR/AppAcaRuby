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

    def won?
        if @board[1] == [1,2,3] || @board[2] == [1,2,3]
            p "You win!"
            return true
        else
            return false
        end
    end

    def move

        until won?
            p "-------"
            p self.board
            p "-------"

            ans = user_input_tower
            puts "Here's what's in that tower: #{@board[ans]}"

        
            disc = @board[ans]


            user_output_tower(ans, disc.shift)
        end
    
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

        ans - 1
    end

    def user_output_tower(initial, disc)
        #Use move to call this method an input disc
        ans = false

        until ans != false
            puts "Enter a tower number(1,2 or 3): "
            chk = gets.to_i

            if chk != (initial - 1)
                @board[initial]
                @board[chk - 1].unshift(disc)
                ans = true
            else
                puts "That's your initial tower."
                next
            end
        end
        
    end
    
end