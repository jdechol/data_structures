require 'binary_heap'

class MinHeap < BinaryHeap
  COMPARATOR = '<'

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

  def compare(a, b)
    a < b
  end
end
