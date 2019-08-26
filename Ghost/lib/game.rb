# class Ghost


# end
let
dictionary = Hash.new(0)
butts = ("a".."z").to_a

butts.each do |let|
    dictionary[let] = []
end


words = ["anus", "anal", "booty", "gland"]

words.each do |word|
    dictionary[word[0]] << word
end

p dictionary

# Dir.chdir(File.dirname(__FILE__))

# File.open("dictionary.txt").each do |line|
#     dictionary[line[0]] += line
# end

# print dictionary