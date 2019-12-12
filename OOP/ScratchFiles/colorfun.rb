# gem install colorize
# gem install win32console  # if on Windows
require 'colorize'

# Basic color output. String is wrapped in color
# and reset color ANSI escape tags.
butts = [["Hello"],["Hi"]]

butts.each do |j|
    j.each do |i|
        puts i.colorize(:color => :white, :background => :black)
    end
end