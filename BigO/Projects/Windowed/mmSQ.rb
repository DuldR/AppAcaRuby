require_relative "MinMaxStackQueue"


def maxRange(arr, w)
    queue = MinMaxStackQueue.new
    best_range = nil

    arr.each.with_index do |x, idx|
        queue.enqueue(x)
        queue.dequeue if queue.size > w

        if queue.size == w
            current_range = queue.max - queue.min
            best_range = current_range if !best_range || current_range > best_range
        end
    end

    best_range

end


if __FILE__ == $PROGRAM_NAME
  p maxRange([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
  p maxRange([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
  p maxRange([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
  p maxRange([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
end