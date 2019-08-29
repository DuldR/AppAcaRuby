testHash = { "G" => ["game", "gang"] }
alpha = ("a".."z").to_a

chk = "gany"


retAnswer = testHash["G"].any? do |word|
    alpha.each do |let|

        if word.include?(chk + let)
            print word
            return true    
        else
            next
        end

        return false
    end
    print "Didn't find anything\n"
end