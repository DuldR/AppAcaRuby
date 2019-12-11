class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    until @game_over == true
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    if @game_over == false
      round_success_message
    end
    
    @sequence_length += 1
    
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    # Test Code For playing
    puts @seq
    ans = []

    until ans.length == @sequence_length
      puts "Enter a color: "
      ans << gets.chomp
    end

    @game_over = true if ans != @seq

  end

  def add_random_color
    @seq << COLORS[rand(0..3)]
  end

  def round_success_message
    puts "Yatta! You did it!"
  end

  def game_over_message
    puts "*Price Is Right losing horn* Mission Failed, we'll get'em next time."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
