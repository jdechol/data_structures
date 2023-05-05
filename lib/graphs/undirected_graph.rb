module Graphs
  class UndirectedGraph
    def initialize(size, edges)
      @size = size
      @grid = Array.new(size) { Array.new(size, -1) }
      edges.each { |tuple| add_edge(*tuple) }
    end

    def add_edge(v1, v2, weight)
      raise ArgumentError.new("vertex out of bounds!") if out_of_bounds(v1) || out_of_bounds(v2)
      grid[v1][v2] = weight
    end

    def remove_edge(v1, v2)
      add_edge(v1, v2, -1)
    end

    def edge_weight(v1, v2)
      grid[v1][v2]
    end

    private

    def out_of_bounds(vertex)
      vertex >= size
    end

    attr_reader :size, :grid
  end
end
