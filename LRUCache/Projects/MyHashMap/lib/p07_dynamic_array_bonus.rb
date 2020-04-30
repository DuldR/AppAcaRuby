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

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray

  include Enumerable

  attr_accessor :count, :store

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    if i > capacity - 1
      return nil
    else
      self.store[i]
    end
  end

  def []=(i, val)
    until i < self.capacity
      resize!
    end

    self.store[i] = val
    self.count += 1

  end

  def capacity
    @store.length
  end

  def include?(val)
    self.each do |int|
      if int == val
        return true
      end
    end

    return false

  end

  def push(val)

    if @store.length == @count
      resize!
    end

    self.store[@count] = val
    self.count += 1



  end

  def unshift(val)
    old_count = @count
    @count += 1

    while old_count > 0
      old_val = @store[old_count - 1]
      @store[old_count] = old_val
      old_count -= 1
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
    return_val = @store[0]
    if @count == 0
      return nil
    else
      @count -= 1
      @store[0] = nil

      while old_count > 1
        old_val = @store[old_count - 1]
        @store[old_count - 2] = old_val
        old_count -= 1
      end
    end

    return_val
    
  end

  def first
    @store[0]
  end

  def last
    @store[@count - 1]
  end

  def each
    iter = 0

    while iter <= @count - 1
      if @store[iter] != nil
        yield @store[iter]
      end

      iter += 1
    end

  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...

    return_arr = []
    check_arr = []

    self.each do |x|
      return_arr << x
    end

    other.each do |x|
      check_arr << x
    end

    return return_arr == check_arr
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    old_store = @store
    iter = 0

  
    @store = StaticArray.new(self.capacity * 2)


    while iter < @count
      @store[iter] = old_store[iter]
      iter += 1
    end


  end
end
