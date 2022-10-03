class BinaryHeap
  attr_reader :heap_array

  def initialize(heap_array=[])
    @heap_array = heap_array
  end

  def add(element)
    @heap_array.push(element)
  end

  def empty?
    @heap_array.empty?
  end

  def peak
    @heap_array.first
  end
end
