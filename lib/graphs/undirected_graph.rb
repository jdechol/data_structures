require 'graphs/matrix'

module Graphs
  class UndirectedGraph < Matrix
    def add_edge(from:, to:, weight:)
      raise ArgumentError.new("vertex out of bounds!") if out_of_bounds(from) || out_of_bounds(to)
      grid[from][to] = weight
      grid[to][from] = weight
    end
  end
end
