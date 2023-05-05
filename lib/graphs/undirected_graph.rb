module Graphs
  class UndirectedGraph
    def initialize(size, edges)
      @size = size
      @grid = Array.new(size) { Array.new(size) }
      edges.each { |edge| add_edge(**edge) }
    end

    def add_edge(from:, to:, weight:)
      raise ArgumentError.new("vertex out of bounds!") if out_of_bounds(from) || out_of_bounds(to)
      grid[from][to] = weight
      grid[to][from] = weight
    end

    def remove_edge(from:, to:)
      add_edge(from: from, to: to, weight: nil)
    end

    def edge_weight(from:, to:)
      grid[from][to]
    end

    private

    def out_of_bounds(vertex)
      vertex >= size
    end

    attr_reader :size, :grid
  end
end
