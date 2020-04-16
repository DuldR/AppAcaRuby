octopi = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh', 'fiiish']
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }


def o2(arr)
    biggest = 'fish'

    arr.each do |leg|
        arr.each do |weiner|

            if leg.length > weiner.length && leg.length > biggest.length
                biggest = leg
            end

        end
    end
    
    biggest

end

def printlogn(arr)
    final = logn(arr)
    final[-1]

end

def logn(array, &prc)
    return array if array.length <= 1

    mid_idx = array.length / 2
    merge(
      logn(array.take(mid_idx), &prc),
      logn(array.drop(mid_idx), &prc),
      &prc
    )
end



  # NB: In Ruby, shift is an O(1) operation. This is not true of all languages.
def merge(left, right, &prc)
    merged_array = []
    prc = Proc.new { |num1, num2| num1.length <=> num2.length } unless block_given?

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
      p merged_array
    end
    
    merged_array + left + right

end

def clever(arr)

    largest = arr[0]

    arr.each do |leg|
        if leg.length > largest.length
            largest = leg
        end 
    end

    largest

end

def dance(direction, tile)

    tile.each.with_index do |dir, i|
        if direction == dir
            return i
        end
    end

end

def constant(direction, tilehash)
    tilehash[direction]
end
