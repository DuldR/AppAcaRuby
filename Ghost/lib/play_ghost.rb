require_relative "ghost"

print "Let's begin."
print "Player 1, enter your first letter."

ghost = Ghost.new

until ghost.game_over? do
    puts "-----------"
    puts "Next Player, enter a letter.\n"
    print "\n"
    ghost.turn

end

