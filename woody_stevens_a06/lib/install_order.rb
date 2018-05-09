# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to


require_relative 'topological_sort'
require_relative 'graph'

def find_max_pair(arr)
  max = arr.reduce(0) do |acc, package_pair|
    pair_max = package_pair.max
    if pair_max > acc
      acc = pair_max
    else
      pair_max
    end
  end

  max
end

def install_order2(arr)
  vertices = Hash.new(nil)
  packages = []
  count = 1

  arr.each do |dependency_pair|
    package = dependency_pair[0]
    dependency = dependency_pair[1]

    if vertices[package] == nil
      vertices[package] = Vertex.new('package')
      packages.push(package)
      count += 1
    end

    if vertices[package] == nil
      vertices[package] = count
      count += 1
    end
  end

  edges = []

  arr.each do |edge|
    edges.push(Edge.new(vertices[edge[1] - 1], vertices[edge[0] - 1]))
  end
  results = topological_sort(vertices)
  results.map!{ |vertex| vertex.value}
  return results
end

def install_order(arr)
  vertices = []
  max = find_max_pair(arr)
  p max
  (1..max).each do |idx|
    vertices.push(Vertex.new(idx))
  end

  edges = []

  arr.each do |edge|
    edges.push(Edge.new(vertices[edge[1] - 1], vertices[edge[0] - 1]))
  end
  results = topological_sort(vertices)
  results.map!{ |vertex| vertex.value}
  return results
end
