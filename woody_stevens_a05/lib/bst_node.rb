class BSTNode
  attr_accessor :parent, :value, :left, :right

  def initialize(value, parent = nil)
    @parent = parent
    @value = value
    @left = nil
    @right = nil
  end
  
end
