# As you saw in the videos for tonight, a map can be implemented using a 2D array. Let's write a Map class (following a similar pattern to Stack and Queue) that implements a map using only arrays.

# Remember, a map stores information in key-value pairs, where the keys are always unique. When implemented with arrays, a map might look something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].

# Our Map class should have the following instance methods: set(key, value), get(key), delete(key), show. Note that the set method can be used to either create a new key-value pair or update the value for a pre-existing key. It's up to you to check whether a key currently exists!

class Map
    def initialize
      @ivar = []
    end

    def set(key,val)

        @ivar.each do |item|
            item[1] = val if item[0] == key
        end

        @ivar << [key,val] if @ivar.include?([key,val]) == false
    end

    def get(key)
        @ivar.each do |item|
            return item if item[0] == key
        end

        return nil
    end

    def delete(key)
        @ivar.each do |item|
            @ivar.delete(item) if item[0] == key
        end
    end
end


