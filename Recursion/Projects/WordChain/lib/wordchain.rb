require "set"

class WordChainer

    attr_reader :dictionary

    def initialize

        @dictionary = Set.new
        @letters = ("a".."z").to_a

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
        @all_seen_words = [source]

        until @current_words.empty?
            new_current_words = []

            @current_words.each do |ele|

                adjacent_words(ele).each do |wrd|

                    if @all_seen_words.include?(wrd)
                        next
                    else
                        @all_seen_words << wrd
                        new_current_words << wrd
                    end
                end

            end
            @current_words = new_current_words
        end

        @all_seen_words


    end

end
