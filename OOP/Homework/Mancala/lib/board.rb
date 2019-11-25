class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new([:stone, :stone, :stone, :stone]) }
    @cups[6] = []
    @cups[13] = []
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    unless start_pos <= 14 && start_pos >= 0
      raise ArgumentError.new "Invalid starting cup"
    end

    if @cups[start_pos].empty?
      raise ArgumentError.new "Starting cup is empty"
    end

  end

  def make_move(start_pos, current_player_name)

    @cups[start_pos] = []
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
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
