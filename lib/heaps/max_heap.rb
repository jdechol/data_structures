require_relative 'binary_heap'

class MaxHeap < BinaryHeap
  def compare(a, b)
    a > b
  end
end
