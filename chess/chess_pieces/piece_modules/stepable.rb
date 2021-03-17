module Stepable
    
  def moves
    valid_moves = move_diffs.map do |dx,dy|
      row,col = self.pos
      row += dx 
      col += dy

      if row.between?(0,7) && col.between?(0,7)
        if board[row,col].empty?
          [row,col]
        elsif board[row,col].color != self.color
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