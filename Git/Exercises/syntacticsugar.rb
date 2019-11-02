class NewDog  
    def initialize(breed)  
      @breed = breed  
    end  
    attr_reader :breed, :name   # create reader only  
    # setter method  
    def name=(nm) 
      @name = nm 
    end  
  end  
  nd = NewDog.new('Doberman')  
  nd.set_name('Benzy')  
  puts nd.name 

  # name=(nm) == name = "xxxx"
  # When ruby sees "name" it automatically ignores the space between name and the requals sign.

class Queue

    def initialize(line)
        @line = line
    end

    def [](pos) # This is equal to nQ.[](0)
        @line[pos]
    end

    def []=(pos,val) # This is equal to nQ.[]=(0, "XXXX")
        @line[pos] = val
    end
end

dmv = ["Adam", "Eve", "Steve"]
nQ = Queue.new(dmv)
