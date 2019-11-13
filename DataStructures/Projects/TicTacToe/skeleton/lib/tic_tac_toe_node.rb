require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :children, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)

    #need to use children in this evaluation.

    
    # print (evaluator == @board.winner || @board.winner.nil?)

    # if (evaluator == @board.winner || @board.winner.nil?) && @board.over?
    #   return false
    # elsif @next_mover_mark == @board.winner && @board.over?
    #   return true
    # elsif evaluator != @board.winner && board.over?
    #   return true
    # elsif @board.winner.nil? && evaluator == @next_mover_mark
    #   return true
    # end



    # if (evaluator == @board.winner.nil? || evaluator == @board.winner) && evaluator == @next_mover_mark
    #   return true
    # elsif (evaluator == @board.winner || @board.winner.nil?) && evaluator != @next_mover_mark
    #   return false
    # else
    #   return true
    # end

    # if (evaluator == @board.winner || @board.winner.nil?) && evaluator != @next_mover_mark
    #   return false
    # else
    #   return true
    # end

    # return false if evaluator == @board.winner
    # return true if evaluator == @next_move_mark && evaluator == @board.winner

    # if evaluator == @board.winner
    #   return false
    # end
    
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
          new_board = board.dup
          new_board[pos] = self.next_mover_mark
          pot_moves << TicTacToeNode.new(new_board, :x, pos)
        end
      else
        prev_pos.each do |pos|
          new_board = board.dup
          new_board[pos] = self.next_mover_mark
          pot_moves << TicTacToeNode.new(board.dup, :o, pos)
        end
      end

    end

    
    pot_moves

  end
end
