require_relative "piece"
require_relative "./piece_modules/slideable.rb"

class Queen < Piece
  include Slideable

  def symbol 
    "\u265B".colorize(color)
  end

  protected
  def move_dirs
    horizontal_dirs + diagonal_dirs  
  end

end