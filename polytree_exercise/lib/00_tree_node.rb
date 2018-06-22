require 'byebug'

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