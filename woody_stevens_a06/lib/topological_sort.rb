require_relative 'graph'
require 'byebug'
require 'pry'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  top_nodes_queue = []

  vertices.each do |vertix|
    top_nodes_queue.push(vertix) if vertix.in_edges.length == 0
  end

  until top_nodes_queue.empty?
    unpopped = top_nodes_queue.shift
    sorted << unpopped

    (unpopped.out_edges.length - 1).downto(0).each do |index|
      edge = unpopped.out_edges[index]
      if edge.to_vertex.in_edges.length == 1

        top_nodes_queue.push(edge.to_vertex)
      end
      to_vertex = edge.to_vertex
      edge.destroy!
    end
  end

  return [] unless vertices.length == sorted.length
  sorted
end
