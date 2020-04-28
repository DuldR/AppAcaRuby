class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.


  end
end

class LinkedList

  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    if @head.next == @tail
      return @head
    else
      return @head.next
    end
  end

  def last
    if @tail.prev == @head
      return @tail
    else
      return @tail.prev
    end
  end

  def empty?
    if @head.next == @tail
      return true
    else
      return false
    end
  end

  def get(key)
    return if self.include?(key) == false

    self.each do |node|
      if node.key == key
        return node.val
      end
    end

  end

  def include?(key)

    self.each do |node|
      if node.key == key
        return true
      end
    end
    
    return false
  end

  def append(key, val)
    old_prev = @tail.prev
    @tail.prev = Node.new(key, val)

    @tail.prev.prev = old_prev
    @tail.prev.next = @tail
    @tail.prev.prev.next = @tail.prev
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)

    self.each do |node|
      if node.key == key
        old_prev = node.prev
        old_next = node.next

        old_prev.next = old_next
        old_next.prev
        old_prev
      end
    end

    nil

  end

  def each
    currentNode = self.first

    until currentNode == @tail
      yield currentNode
      currentNode = currentNode.next
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end

end
