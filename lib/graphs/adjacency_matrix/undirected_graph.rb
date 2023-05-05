require 'graphs/adjacency_matrix/matrix'

module Graphs
  module AdjacencyMatrix
    class UndirectedGraph < Matrix
      def add_edge(from:, to:, weight:)
        verify_bounds(from, to)
        grid[from][to] = weight
        grid[to][from] = weight
      end
    end
  end
end
