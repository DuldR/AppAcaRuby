  class LRUCache
    def initialize(size)
        @size = size
        @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.size
    end

    def add(el)
      # adds element to cache according to LRU principle
      idx = @cache.find_index(el) 

      if idx == nil
        @cache.unshift(el)
        if self.count > @size
            @cache.pop
        end
      else
        @cache.delete_at(idx)
        @cache.unshift(el)
      end

    end

    def show
      # shows the items in the cache, with the LRU item first
      p @cache
    end

    private
    # helper methods go here!
  end