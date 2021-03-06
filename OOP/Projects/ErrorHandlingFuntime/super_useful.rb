# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
    
  rescue ArgumentError => e
    puts "That's not a valid input"
    puts "Error was: #{e.message}"
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)

  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise "That ain't no fruit!"
  end 

end

def feed_me_a_fruit

  begin
    puts "Hello, I am a friendly monster. :)"

    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue
    if maybe_fruit = "coffee"
      puts "I's dearly luvs coffee. But I would prefer fruit!"
      retry
    end

  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if name.length <= 0 || fav_pastime.length <= 0
      raise "Raisin' Hell"
    end
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    if @yrs_known < 5
      raise "Lmao you think that's a bestie?!?!?"
    end
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


