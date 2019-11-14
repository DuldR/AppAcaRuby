require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    
    if evaluator == @board.winner
      return false
    elsif evaluator == next_mover_mark
      self.children.all? { |node| node.board.winner != evaluator }

    elsif evaluator != next_mover_mark
      self.children.any? { |node| node.board.winner == next_mover_mark}
    end

    
  end

  def winning_node?(evaluator)

    if evaluator == @board.winner
      return true
    elsif evaluator == next_mover_mark && @board.winner.nil?
      self.children.any? { |node| node.board.winner == evaluator}
    elsif evaluator != next_mover_mark && @board.winner.nil?
      self.children.all? { |node| node.board.winner == next_mover_mark }
    else
      return false
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    pot_moves = []
    prev_pos = [0, 1, 2].product([0, 1, 2])

    prev_pos.each do |pos|
      next unless board.empty?(pos)
      new_board = @board.dup
      new_board[pos] = self.next_mover_mark
      next_mover_mark = (self.next_mover_mark == :x ? :o : :x)

      pot_moves << TicTacToeNode.new(new_board, next_mover_mark, pos)

    end


    
    pot_moves

  end
end
