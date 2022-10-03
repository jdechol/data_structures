class BinaryHeap
  attr_reader :heap_array

  def initialize(data=[])
    @heap_array = []
    data.each { |element| add(element) }
  end

  def add(element)
    heap_array.push(element)
    bubble_up
  end

  def empty?
    heap_array.empty?
  end

  def peak
    heap_array.first
  end

  private

  def bubble_up
    position = heap_array.length - 1
    while position > 0 && heap_array[position] > heap_array[parent(position)]
      swap(position, parent(position))
      position = parent(position)
    end
  end

  def swap(i, j)
    temp = heap_array[j]
    heap_array[j] = heap_array[i]
    heap_array[i] = temp
  end

  def parent(position)
    (position - 1) / 2
  end

  def left_child(position)
    2 * position + 1
  end

  def right_child(position)
    2 * position + 2
  end
end
