require_relative 'piece'
require_relative 'pieces'
require 'byebug'

class Board

  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
    fill_board
    # place_pieces
  end

  def place_pieces
    #4 kn, R, B
    #2 Q K
    #16 pwn
    #16 null_p
    #TODO: will be abstracted out later
    knight_pos = [[0,1],[0,6],[7,1],[7,6]]
    knights = 4.times do |i|
      if i < 2
        pos = knight_pos.shift
        board[pos] = Knight.new(:black, board, pos) 
      else
        pos = knight_pos.shift
        board[pos] = Knight.new(:white, board, pos) 
      end
    end
    # TODO needs more object pieces
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
    # get the null piece (singleton)
  end

  def fill_board
    board.each_with_index do |row, i|
      row.each_with_index do |el, j|
        if [0,1].include?(i)
          @board[i][j] = Piece.new(:white, board, [i,j])
        elsif [6,7].include?(i)
          @board[i][j] = Piece.new(:black, board, [i,j])
        else 
          @board[i][j] = nil
        end 
      end
    end
  end

end