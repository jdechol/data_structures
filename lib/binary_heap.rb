class BinaryHeap
  def initialize(data=[])
    @data = data
  end

  def empty?
    @data.empty?
  end

  def peak
    @data.first
  end
end
