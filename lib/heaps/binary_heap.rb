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

  def pop
    raise StandardError.new("Heap is empty!") if empty?

    popped = peak
    swap(0, heap_array.length - 1)
    heap_array.pop
    bubble_down(0)
    popped
  end

  private

  def bubble_up
    position = heap_array.length - 1
    parent_position = parent(position)
    while position > 0 && compare(heap_array[position], heap_array[parent_position])
      swap(position, parent_position)
      position = parent_position
      parent_position = parent(position)
    end
  end

  def bubble_down(position)
    left = left_child(position)
    right = right_child(position)
    smallest = position

    if left < heap_array.length && compare(heap_array[left], heap_array[position])
      smallest = left
    end

    if right < heap_array.length && compare(heap_array[right], heap_array[smallest])
      smallest = right
    end

    if smallest != position
      swap(position, smallest)
      bubble_down(smallest)
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
