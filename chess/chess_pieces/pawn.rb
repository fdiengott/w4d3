require_relative "piece"

class Pawn < Piece
  
  def symbol 
    "\u2654".colorize(color)
  end

  def moves 
    #call forward_dir
  end

  private
  def at_start_row?
    if (self.pos[0] == 1 && self.color == :black) || 
      (self.pos[0] == 6 && self.color == :white)
      true
    else 
      false 
    end
  end

  def forward_dir 
    if self.color == :black
      return 1
    elsif self.color == :white
      return -1
    else 
      raise 'Unsupported color'
    end
  end
  
  def forward_steps 
    row,col = self.pos
    valid_moves = []

    next_pos = [row + forward_dir, col]

    if self.board[next_pos].empty? 
      valid_moves << next_pos
      next_pos = [row + (2 * forward_dir),col]
      if self.board[next_pos].empty? && self.at_start_row? 
        valid_moves << next_pos
      end
    end
    
    valid_moves
  end

  def side_attacks 
    # if obj at the dig pos = opposite color we return pos
  end
end