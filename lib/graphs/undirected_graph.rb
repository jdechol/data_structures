module Graphs
  class UndirectedGraph
    def initialize(size, edges)
      @size = size
      @grid = Array.new(size) { Array.new(size, 0) }
      edges.each { |tuple| add_edge(*tuple) }
    end

    def add_edge(v1, v2, value)
      raise ArgumentError.new("vertex out of bounds!") if v1 >= size || v2 >= size
      grid[v1][v2] = value
    end

    def weight(v1, v2)
      grid[v1][v2]
    end

    private

    attr_reader :size, :grid
  end
end
