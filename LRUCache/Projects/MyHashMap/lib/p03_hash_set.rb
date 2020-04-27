class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)

    if num_buckets == @count
      resize!
    end

    if include?(key) == false
      self[key] << key
      @count += 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`

    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    (num_buckets).times { @store << Array.new }
  end
end
