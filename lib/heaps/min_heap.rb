require_relative 'binary_heap'

class MinHeap < BinaryHeap
  def compare(a, b)
    a < b
  end
end
