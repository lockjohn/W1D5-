require 'byebug'
class KnightPathFinder

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]
    build_move_tree
  end  
  
  def build_move_tree
    # @move_tree = 
  end
  
  def self.valid_moves(pos)
    result = []
    base_case= [[2,3],[2,5],[3,2],[3,6],[5,2],[5,6],[6,3],[6,5]]
    x_shift = pos[0]-4
    y_shift = pos[1]-4
    result = base_case.map do |el|
      el[0]+x_shift
      el[1]+y_shift
    end
    result.select do |el|
      el[0].between?(0..7) && el[1].between?(0..7) 
    end
            #current position is most recent [] in visited_positions
    # current = @visited_positions.last
    #is position on the board
    #is it the right movement
    # if pos.zero? 
  end
  
  def find_path
    
  end
  
  def new_move_positions(pos)
    
  end

end


class PolyTreeNode
  
  attr_reader :parent, :children, :value
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  def parent=(object)
    return if @parent == nil && object.nil?
    self.parent.children.delete(self) if @parent != nil
    @parent = object
    self.parent.children << self if object != nil
    # elsif @parent !=nil && object.nil?
    #   # +1. delete self from parent's children array
    #   #+2. change self.parent to the object
    # elsif @parent !=nil && object != nil 
    #   #+1. delete self from parent's children array
    #   #+2. change self.parent to the object
    #   #3. self's parent's children include self
    # elsif @parent ==nil && object != nil
    #   #+2. change self.parent to the object
    #   #3. self's parent's children include self
    # end
  end    
  def add_child(child_node)
    child_node.parent = self
    # self.children << child_node unless self.children.include?(child_node)
  end
  # def add_child(child_node)
  #    unless self.children.include?(child_node)
  #      child_node.parent = self
  #      self.children << child_node
  #    end
  # end
  def remove_child(child_node)
    raise "Not a child" unless self.children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    # debugger
    return self if self.value == target_value
    self.children.each do |el| 
      result = el.dfs(target_value)
       return result if !result.nil?
    end
    return nil 
  end
  
  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current = queue.shift
      return current if current.value == target_value
      queue += current.children
    end
    return nil
  end
  
  # def inspect
  #   "parent is #{self.parent}, it's children is #{self.children}, value: #{self.value}"
  # end
  private
  
end