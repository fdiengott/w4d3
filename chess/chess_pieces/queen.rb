require "piece"

class Queen < Piece
  include Slideable

  def symbol 
    :Q
  end

  private 
  def move_dirs
    
  end



end