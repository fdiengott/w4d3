module Slideable
     
    HORIZONTAL_DIRS = [
        [0,1],  #right 
        [0,-1], #left
        [1,0], #down 
        [-1,0] #up
    ].freeze

    DIAGONAL_DIRS = [
        [-1,1], #upright
        [-1,-1], #upleft
        [1,1], #downright
        [1,-1] #downleft
    ].freeze

    
    def moves
        #returns all moves can be done 
        move_dirs.map do |dx,dy|   
            grow_unblocked_moves_in_dir(dx,dy)
        end
    end

    #getters
    def horizontal_dirs 
        HORIZONTAL_DIRS
    end

    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    private
    def move_dirs
        #overwrtten by subclasses
        raise NotImplementedError
    end
    
    def grow_unblocked_moves_in_dir(dx,dy)

    end
end

#(-6..6).map{|i| [i,0]} + (-6..6).map{|i| [0,i]} - [[0,0]]