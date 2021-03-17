require 'byebug'

module Stepable
    
  def moves
    valid_moves = move_diffs.map do |dx,dy|
      row,col = self.pos
      row += dx 
      col += dy

      if row.between?(0,7) && col.between?(0,7)
        new_pos = [row,col]
        
        if self.board[new_pos].empty?
          [row,col]
        elsif self.board[new_pos].color != self.color
          [row,col]
        end
      end
    end
    valid_moves.reject(&:nil?)
  end

  private
  def move_diffs
    raise NotImplementedError
  end

end