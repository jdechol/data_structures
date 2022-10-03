class BinaryHeap
  attr_reader :data

  def initialize(data=[])
    @data = data
  end

  def add(element)
    @data.push(element)
  end

  def empty?
    @data.empty?
  end

  def peak
    @data.first
  end
end
