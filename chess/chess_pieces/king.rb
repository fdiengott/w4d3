require_relative "piece"
require_relative "./piece_modules/stepable.rb"

class King < Piece
  include Stepable

  def symbol 
    "\u2654".colorize(color)
  end

  protected
  def move_dirs
    [
        [0,1], #right
        [1,1], #downright
        [1,0], #down
        [1,-1], #downleft
        [0,-1], #left
        [-1,-1], # upright
        [-1,0] #up
    ]
  end

end