require_relative "dictionary"

class Fragment


    def initialize(frag)
        @upTo = frag
        @frag = frag
        @dictionary = Dictionary.new.getDict
    end

    def checkDict

        if @dictionary[@upTo[0]].any? { |word| word.include?(@upTo + @frag) }
            @upTo += @frag
        else
            print "not Valid"
        end

    end
    
end