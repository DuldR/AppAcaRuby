
#This is 2O(n) and therefore linear
def first_anagram?(first, second)
    chk = first.split("")

    chkArr = chk.permutation.to_a
    
    chkArr.map { |word| word.join("") }.include?(second)

end

#This is O(n^2). A nested loop with find_index.
def sec_anagram?(first, second)

    scd = second.split("")

    first.each_char do |char|
        if second.include?(char)
            scd.delete_at(scd.find_index(char))
        end
    end

    return scd.empty?

end

#4O(n) or just O(n)
def third_anagram?(first, second)

    return first.chars.sort.join == second.chars.sort.join

end

def fourth_anagram?(first,second)
    chk = Hash.new

    first.each_char do |char|
        if chk[char]
            chk[char] += 1
        else
            chk[char] = 1
        end
    end

    second.each_char do |char|
        if chk[char]
            chk[char] += 1
        else
            chk[char] = 1
        end
    end


    chk.all? { |k, v| (v % 2) == 0 }

end

p first_anagram?('gizmo', 'sally')
p first_anagram?('elvis', 'lives')

p sec_anagram?('protectional', 'lactoprotein')
p sec_anagram?('elvis', 'lives')

p third_anagram?('protectional', 'lactoprotein')
p third_anagram?('gizmo', 'lives')

p fourth_anagram?('protectional', 'lactoprotein')
p fourth_anagram?('gizmo', 'lives')


