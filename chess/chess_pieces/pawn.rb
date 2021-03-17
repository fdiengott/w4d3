require_relative "piece"

class Pawn < Piece
  
  def symbol 
    "\u265F".colorize(color)
  end

  def moves 
    forward_steps + side_attacks
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

    if self.board[next_pos].empty? && on_board?(next_pos)
      valid_moves << next_pos
      next_pos = [row + (2 * forward_dir),col]
      if self.board[next_pos].empty? && at_start_row? 
        valid_moves << next_pos
      end
    end
    
    valid_moves
  end

  def side_attacks 
    row,col = self.pos
    valid_moves = []

    #downright for black piece / upleft for white
    next_pos = [row + forward_dir, col + forward_dir] 
    valid_moves << next_pos if valid_move(next_pos)

    #downleft for black / upright for white
    next_pos = [row + forward_dir, col - forward_dir] 
    valid_moves << next_pos if valid_move(next_pos)
    
    valid_moves
  end

  def valid_move(pos)
    if on_board?(pos)
      if !self.board[pos].empty? && self.board[pos].color != self.color
        return true
      end
    end
    false
  end

  def on_board?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

end