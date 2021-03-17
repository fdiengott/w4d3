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
    #bool row 1 || 6 => true
  end

  def forward_dir 
    #return 1 || -1
    #whatever forward for this color piece
  end
  
  def forward_steps 
    #call at_start_row?
    # =>T then 2steps || 1 step forward 
      # foward dir
    # =>F then only 1 step forward
  end

  def side_attacks 
    # if obj at the dig pos = opposite color we return pos
  end
end