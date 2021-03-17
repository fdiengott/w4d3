
class Piece
  attr_accessor :pos
  attr_reader :color
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def moves
    #TODO : will use move_dirs from module
    #returns an arry of possible moves
    raise "Need to override parent class!!"
  end

  def to_s
    self.symbol
  end

  def empty?
    self.is_a?(NullPiece)
  end

  # def valid_moves
  #   #need 
  # end

  # def symbol
    
  # end

  def inspect
     "#<Piece pos: #{pos}, color: #{color}>"
  end
  
  private 
  def move_into_check?(end_pos)

  end


end