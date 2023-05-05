module Graphs
  class UndirectedGraph
    def initialize(size, edges)
      @size = size
      @grid = Array.new(size) { Array.new(size) }
      edges.each { |edge| add_edge(edge.left, edge.right, edge.weight) }
    end

    def add_edge(left, right, weight)
      raise ArgumentError.new("vertex out of bounds!") if out_of_bounds(left) || out_of_bounds(right)
      grid[left][right] = weight
    end

    def remove_edge(left, right)
      add_edge(left, right, nil)
    end

    def edge_weight(left, right)
      grid[left][right]
    end

    private

    def out_of_bounds(vertex)
      vertex >= size
    end

    attr_reader :size, :grid
  end
end
