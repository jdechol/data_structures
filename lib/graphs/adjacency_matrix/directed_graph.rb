require 'graphs/adjacency_matrix/matrix'

module Graphs
  module AdjacencyMatrix
    class DirectedGraph < Matrix
      def add_edge(from:, to:, weight:)
        verify_bounds(from, to)
        grid[from][to] = weight
      end
    end
  end
end
