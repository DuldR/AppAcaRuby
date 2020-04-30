class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  # private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  attr_accessor :count, :store

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    self.store[i]
  end

  def []=(i, val)
    if @count == capacity
      resize!
    end

    self.store[i] = val
    self.count += 1

  end

  def capacity
    @store.length
  end

  def include?(val)
  end

  def push(val)
    self.store[count] = val
    self.count += 1
  end

  def unshift(val)
    old_count = @count
    @count += 1

    while old_count > 0
      old_val = @store[old_count - 1]
      p @store
      # @store[old_count] = old_val
      p "First"
      p old_count
      old_count -= 1
      p "After"
      p old_count
    end

    self.store[0] = val

  end

  def pop
    if @count > 0
      return_val = self.store[count - 1]

      self.store[count - 1] = nil

      @count -= 1

      return return_val
    else
      return nil
    end

  end

  def shift
    old_count = @count
    if @count == 0
      return nil
    else
      @count -= 1

      @store[0] = nil

      # while old_count > 0
      #   old_val = @store[old_count - 1]
      #   @store[old_count - 2] = old_val
      #   old_count -= 1
      # end
    end

  end

  def first
  end

  def last
  end

  def each
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    old_store = @store

  end
end
