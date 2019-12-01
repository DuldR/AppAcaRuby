 module What
    def greet
        p "Howdy"
    end
 end

 class Human
    include What

    def initialize(name)
        @name = name
    end

    def hello
        p @name
        greet
    end
end