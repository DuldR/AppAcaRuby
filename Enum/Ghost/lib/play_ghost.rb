require_relative "ghost"

print "Let's begin."
print "Player 1, enter your first letter."

ghost = Ghost.new(STDIN.gets.chomp)

