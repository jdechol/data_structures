require 'graphs/adjacency_matrix/matrix'

module Graphs
  module AdjacencyMatrix
    class DirectedGraph < Matrix
      def add_edge(from:, to:, weight:)
        raise ArgumentError.new("vertex out of bounds!") if out_of_bounds(from) || out_of_bounds(to)
        grid[from][to] = weight
      end
    end
  end
end
