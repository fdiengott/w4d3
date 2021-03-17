module SlideAble
     
    HORIZONTAL_DIRS = (-6..6).map{|i| [i,0]} + (-6..6).map{|i| [0,i]} - [[0,0]]
    DIAGONAL_DIRS = 

    

    
    def moves
        #returns all moves can be done
    end

    def horizontal_dirs 
        HORIZONTAL_DIRS
    end

    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    private
    def move_dirs
        #overwrtten by subclasses

    end
    
    def grow_unblocked_moves_in_dir(dx,dy)

    end
end