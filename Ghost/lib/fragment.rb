require_relative "dictionary"

class Fragment

    attr_reader :check, :dictionary

    def initialize(frag)
        @check = frag.downcase
        @dictionary = Dictionary.new.getDict
    end

    def checkDict(checkFrag)

        checkFrag = checkFrag.downcase

        if @dictionary[@check[0]].any? { |word| word.include?(@check + checkFrag) }
            print "That's a valid answer\n"
            @check += checkFrag
            return true
        else
            print "Not a valid answer."
            return false
        end

    end

    def anyMore?
        alpha = ("a".."z").to_a
        validAnswers = []

        @dictionary[@check[0]].each do |word|
            alpha.each do |let|
                if word.include?(@check + let)
                    validAnswers << word
                else
                    next
                end
            end
        end

        return !validAnswers.empty?
    end
    
end