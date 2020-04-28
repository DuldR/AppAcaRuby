require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    if bucket(key).empty?
      return false
    else
      bucket(key).each do |node|
        if node.key == key
          return true
        end
      end
    end   
  end

  def set(key, val)

    bucket(key).each do |node|
      if node.key == key
        node.val = val
      end
    end

    bucket(key).append(key,val)
      
  end

  def get(key)


    bucket(key).each do |node|
      return node.val if node.key == key
    end


    nil

  end

  def delete(key)
  end

  def each
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`

    @store[key.hash % num_buckets]
  end
end
