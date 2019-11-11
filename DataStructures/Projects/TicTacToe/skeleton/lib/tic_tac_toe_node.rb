require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :children

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    pot_moves = []

    if @board.rows.all? {|col| col.all?(&:nil?) }
        # (0..2).each do |row|
        #   (0..2).each do |col|
        #     pot_moves << [row, col]
        #   end
        # end
      9.times { pot_moves << TicTacToeNode.new(board, :o)}
    end

    
    pot_moves

  end
end
