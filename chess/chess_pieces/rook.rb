require_relative "piece"
require_relative "./piece_modules/slideable.rb"

class Rook < Piece
  include Slideable

  def symbol 
    "\u2656".colorize(color)
  end

  protected
  def move_dirs
    horizontal_dirs  
  end

end