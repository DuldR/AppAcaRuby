require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache

  attr_accessor :map, :store

  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)

    if @map.include?(key) == false
      if @map.count < @max
        @map.set(key, @store.append(key, @prc.call(key)))
      else
        @map.set(key, @store.append(key, @prc.call(key)))
        eject!
      end
    else
      old_node = @map.get(key)
      eject!
      update_node!(old_node)

    end

    @map.get(key).val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    @map.set(node.key, @store.append(node.key, node.val))
    
  end

  def eject!
    young_key = @store.first.key
    @map.delete(young_key)
    @store.remove(young_key)
  end
end
