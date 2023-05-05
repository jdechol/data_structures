module Graphs
  class Matrix
    def initialize(size, edges)
      @size = size
      @grid = Array.new(size) { Array.new(size) }
      edges.each { |edge| add_edge(**edge) }
    end

    def add_edge(from:, to:, weight:)
      raise NotImplementedError.new("Implement add_edge in your subclass!")
    end

    def remove_edge(from:, to:)
      raise NotImplementedError.new("Implement remove_edge in your subclass!")
    end

    def edge_weight(from:, to:)
      raise NotImplementedError.new("Implement edge_weight in your subclass!")
    end

    private

    def out_of_bounds(vertex)
      vertex >= size
    end

    attr_reader :size, :grid
  end
end
