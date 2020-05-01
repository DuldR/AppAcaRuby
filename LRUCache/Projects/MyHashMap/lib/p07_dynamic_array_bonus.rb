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
    elsif i == -1
      self.last
    elsif i < 0 && (i * -1) <= self.capacity
      self.store[self.capacity - (i * -1)]
    else
      self.store[i]
    end
  end

  def []=(i, val)
    until i < self.capacity
      resize!
    end

    if i == -1
      self.store[self.last]
      self.count += 1
    elsif i < 0 && (i * -1) <= self.capacity
      self.store[self.capacity - (i * -1)] = val
      self.count += 1
    else
      self.store[i] = val
      self.count += 1
    end

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
    old_count = 1
    return_val = @store[0]
    @store[0] = nil

    while old_count < self.capacity
      old_val = @store[old_count]
      @store[old_count - 1] = old_val
      old_count += 1
    end

    @store[self.capacity - 1] = nil
    
    if return_val != nil
      @count -= 1
    end

    return_val
    
  end

  def first
    @store[0]
  end

  def last
    final_index = 0

    self.reverse_each.with_index do |x, i|
      if x == nil
        next
      else
        break final_index = (self.capacity - 2) - i
      end
    end

    @store[final_index]
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


    while iter < self.capacity
      if iter >= old_store.length
        iter += 1
        next
      else
        @store[iter] = old_store[iter]
        iter += 1
      end

    end


  end
end
