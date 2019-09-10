class Dictionary

    def getDict
        dictionary = Hash.new(0)
        letters = ("a".."z").to_a

        letters.each do |let|
            dictionary[let] = []
        end

        Dir.chdir(File.dirname(__FILE__))

        File.open("dictionary.txt").each do |line|
            dictionary[line[0]] << line.chomp
        end

        return dictionary
    end

end