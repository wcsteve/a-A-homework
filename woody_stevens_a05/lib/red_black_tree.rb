# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value, current_node = @root)
    if @root == nil
      return @root = BSTNode.new(value)
    end

    next_right = current_node.right
    next_left = current_node.left

    if value > current_node.value
      return insert(value, next_right) unless next_right.nil?
      current_node.right = BSTNode.new(value, current_node)
    else value <= current_node.value
      return insert(value, next_left) unless next_left.nil?
      current_node.left = BSTNode.new(value, current_node)
    end
  end

  def find(value, tree_node = @root)
    return tree_node if tree_node.value == value
    return nil if tree_node.left == nil && tree_node.right == nil

    if tree_node.value > value
      find(value, tree_node.left)
    else
      find(value, tree_node.right)
    end
  end

  def delete(value)
    node = find(value)
    p node.value
    # parent_left_child = node.parent.left
    # parent_right_child = node.parent.right
    if node.right.nil? && node.left.nil?
      return @root = nil if @root == node
      node.parent.left = nil if node.parent.left == node
      node.parent.right = nil if node.parent.right == node
      node.parent = nil
      node = nil
    elsif node.right.nil? && node.left != nil
      node.parent.left = node.left if node.parent.left == node
      node.parent.right = node.left if node.parent.right == node
      node = nil
    elsif node.left.nil? && node.right != nil
      node.parent.left = node.right if node.parent.left == node
      node.parent.right = node.right if node.parent.right == node
      node = nil
    else
      newNode = maximum(node.left)
      p newNode.value
      node.parent.left = newNode if node.parent.left == node
      node.parent.right = newNode if node.parent.right == node
      node.left.right = newNode.left
      newNode.parent = node.parent
      newNode.left = node.left
      newNode.right = node.right
      node = nil
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right == nil
    maximum(tree_node.right)
  end

  def depth(tree_node = @root, count = 0)
    return count if tree_node.right.nil? && tree_node.left.nil?
    count += 1
    right = count
    left = count

    if tree_node.right != nil
      right = depth(tree_node.right, count)
    end

    if tree_node.left != nil
      left = depth(tree_node.left, count)
    end

    return [right, left].max
  end

  def is_balanced?(tree_node = @root)

    return false if tree_node.nil?

    is_balanced?(tree_node.left)
    is_balanced?(tree_node.right)

    if depth(tree_node.left) - depth(tree_node.right) <= 1 &&
      depth(tree_node.left) - depth(tree_node.right) >= -1
      return true
    else
      return false
    end
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return arr if tree_node.nil?
    in_order_traversal(tree_node.left, arr)
    arr << tree_node.value
    in_order_traversal(tree_node.right, arr)
  end


  private
  # optional helper methods go here:

end
