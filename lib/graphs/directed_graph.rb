require 'graphs/matrix'

module Graphs
  class DirectedGraph < Matrix
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
  end
end
