# gem install colorize
# gem install win32console  # if on Windows
require 'colorize'

# Basic color output. String is wrapped in color
# and reset color ANSI escape tags.
puts "Blue text".blue

puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)


butts = [["Hello"],["Hi"]]

butts.each do |j|
    j.each do |i|
        puts i.colorize(:color => :black)
    end
end