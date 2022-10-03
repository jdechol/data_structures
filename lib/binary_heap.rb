class BinaryHeap
  attr_reader :heap_array

  def initialize(data=[])
    @heap_array = []
    build_heap(data)
  end

  def build_heap(data)
    data.each { |element| add(element) }
  end

  def add(element)
    heap_array.push(element)
  end

  def empty?
    heap_array.empty?
  end

  def peak
    heap_array.first
  end
end
