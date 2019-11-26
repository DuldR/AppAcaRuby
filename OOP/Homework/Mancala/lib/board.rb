class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new([:stone, :stone, :stone, :stone]) }
    @cups[6] = []
    @cups[13] = []

    @player_one = name1
    @player_two = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    unless start_pos <= 13 && start_pos >= 0
      raise ArgumentError.new "Invalid starting cup"
    end

    if @cups[start_pos].empty?
      raise ArgumentError.new "Starting cup is empty"
    end

  end

  def make_move(start_pos, current_player_name)
    
    rock_index = start_pos
    rock_dis = @cups[start_pos]
    @cups[start_pos] = []

    until rock_dis.empty? == true
      rock_index += 1

      if rock_index == 6 && current_player_name == @player_two
        next
      elsif rock_index == 13 && current_player_name == @player_one
        next
      elsif rock_index > 13
        @cups[rock_index - 14] << rock_dis.shift
      else
        @cups[rock_index] << rock_dis.shift
      end
    end

    
    if rock_index > 13
      rock_index -= 14
    end


    self.render

    next_turn(rock_index)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx

    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
    # if @cups[ending_cup_idx].length == 1
    #   return :switch
    # end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end

b = Board.new("1", "2")
b.cups[0] = []
b.make_move(10, "2")
