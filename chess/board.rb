# require_relative './chess_pieces/piece'
require_relative 'pieces'
require 'byebug'

#Black pieces : row 0 && 1 to start
class Board

  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
    fill_board
    # place_pieces
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end
  
  def []=(pos, val)
    row, col = pos
    @board[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].nil? #TODO :refactor when we have null pieces
      raise "There is no piece at #{start_pos}."
    end

    if !valid_pos?(end_pos) 
      raise "The piece cannot move to #{end_pos}."
    end

    #piece get updated
    self[start_pos].pos = end_pos
    self[end_pos] = self[start_pos]
    self[start_pos] = nil #TODO :refactor to null pieces
  end


  def valid_pos?(pos)
    row,col = pos
    row.between?(0,7) && col.between?(0,7)
  end

  private 

  def null_piece
    NullPiece.instance
  end

  def fill_board
    board.each_with_index do |row, i|
      row.each_with_index do |el, j|
        set_back_row(i,:black) if i == 0
        set_pawns(i,:black) if i == 1
        
        @board[i][j] = null_piece if (2..5).to_a.include?(i)  

        set_pawns(i,:white) if i == 6
        set_back_row(i,:white) if i == 7
        
      end
    end
  end

  def set_back_row(row,color)
    (0..7).each do |j|
      if [0,7].include?(j) 
        @board[row][j] = Rook.new(color, self, [row,j])
      elsif [1,6].include?(j)
        @board[row][j] = Knight.new(color, self, [row,j])
      elsif [2,5].include?(j)
        @board[row][j] = Bishop.new(color, self, [row,j])
      elsif j == 3
        @board[row][j] = Queen.new(color, self, [row,j])
      elsif j == 4
        @board[row][j] = King.new(color, self, [row,j])
      end
    end
  end

  def set_pawns(row,color)
    (0..7).each do |j|
      @board[row][j] = Pawn.new(color, self, [row,j])
    end
  end
end