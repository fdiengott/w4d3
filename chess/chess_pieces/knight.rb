require_relative "piece"
require_relative "./piece_modules/stepable.rb"

class Knight < Piece
  include Stepable

  def symbol 
    "\u265E".colorize(color)
  end

  protected
  def move_diffs
    changes = [
        [2,1],
        [2,-1],
        [-2,1],
        [-2,-1]
    ] 
    changes += changes.map{|r,c| [c,r]}
  end

end