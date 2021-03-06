class Vertex
  attr_accessor :in_edges, :out_edges, :number
  attr_reader :value

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  attr_reader :from_vertex, :to_vertex, :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost
    from_vertex.out_edges.push(self)
    to_vertex.in_edges.push(self)
  end

  def destroy!
    self.from_vertex.out_edges.delete(self)
    self.to_vertex.in_edges.delete(self)
    @from_vertex = nil
    @to_vertex = nil
  end
end
