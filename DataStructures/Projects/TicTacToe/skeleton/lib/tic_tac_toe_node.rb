require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :children, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    pot_moves = []
    prev_pos = [0, 1, 2].product([0, 1, 2])

    if @board.rows.all? {|col| col.all?(&:nil?) }

      if @next_mover_mark == :o
        prev_pos.each do |pos|
          pot_moves << TicTacToeNode.new(board.dup, :x, pos)
        end
      else
        prev_pos.each do |pos|
          pot_moves << TicTacToeNode.new(board.dup, :o, pos)
        end
      end

    end

    
    pot_moves

  end
end
