require "set"

class WordChainer

    attr_reader :dictionary

    def initialize

        @dictionary = Set.new
        @letters = ("a".."z").to_a

        # Might need to comment this out based on comp
        #Dir.chdir(File.dirname("/mnt/c/Users/VF034781/Documents/TestBed/Recursion/Projects/WordChain/lib/dictionary.txt"))
        # ---------------------------------------- #
        
        File.open("dictionary.txt").each do |line|
            @dictionary << line.chomp
        end

    end

    def adjacent_words(word)
        found_words = []

        word.each_char.with_index do |ele, idx|
            @letters.each do |let|
                if idx == 0
                    testCase = let + word[1..-1]
                elsif idx == (word.length - 1)
                    testCase = word[0...-1] + let
                else
                    testCase = word[0...idx] + let + word[(idx + 1)..-1]
                end

                found_words << testCase if @dictionary.include?(testCase)

            end
        end

        found_words.uniq.sort
    end

    def run(source, target)

        @current_words = [source]
        @all_seen_words = { source => nil }

        until @current_words.empty?
            explore_current_words(@current_words)
        end

        build_path(target)
    end

    def explore_current_words(arr)
        new_current_words = []

        arr.each do |ele|
            adjacent_words(ele).each do |wrd|

                if @all_seen_words.include?(wrd)
                    next
                else
                    @all_seen_words[wrd] = ele
                    new_current_words << wrd
                end
            end
        end

        @current_words = new_current_words
    end

    def build_path(target)
        path = []

        orig = target
        
        until @all_seen_words[orig] == nil
            path << orig
            orig = @all_seen_words[orig]
        end

        path << @all_seen_words.key(nil)


    end

end
