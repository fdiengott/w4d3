require 'colorize'

class Piece
  attr_accessor :pos
  attr_reader :color, :board
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  
  def to_s
    self.symbol
  end
  
  def empty?
    false 
  end
  
  def inspect
    "#<#{self.class}, pos: #{pos}, color: #{color}>"
  end
  
  def moves
    raise NotImplementedError 
  end

  def valid_moves
    raise NotImplementedError
  end
  
  def symbol
    raise NotImplementedError
  end

  
  private 
  def move_into_check?(end_pos)
    
  end


end