require_relative 'binary_heap'

module Heaps
  class MaxHeap < BinaryHeap
    def compare(a, b)
      a > b
    end
  end
end
