require 'max_heap'

describe MaxHeap do
  it "can handle a large data set" do
    data = []
    1000.times { data.push(rand(1000)) }
    heap = described_class.new(data)
    data.sort!.reverse!
    1000.times do |index|
      expect(heap.pop).to eq data[index]
    end
  end

  describe "#pop" do
    it "can remove elements until empty" do
      heap = described_class.new([3,10,5,-3])
      expect(heap.pop).to eq 10
      expect(heap.pop).to eq 5
      expect(heap.pop).to eq 3
      expect(heap.pop).to eq -3
      expect { heap.pop }.to raise_error(StandardError, "Heap is empty!")
    end
  end

  describe "#peak" do
		it "returns nil when the heap is empty" do
      expect(described_class.new).to be_empty
			expect(subject.peak).to eq nil
    end

    it "returns the element when there is only one element" do
      expect(described_class.new([1]).peak).to eq 1
    end

    it "returns the largest element when adding a larger element" do
      heap = described_class.new([5])
      heap.add(7)
      expect(heap.peak).to eq 7
    end

    it "returns the largest element when adding a smaller element" do
      heap = described_class.new([5])
      heap.add(3)
      expect(heap.peak).to eq 5
    end

    it "returns the max element when multiple elements are in the heap" do
      data = [5,8,16,1,3]
      expect(described_class.new(data).peak).to eq data.max
    end
  end

  describe "#empty" do
    it "returns true when there are no elements" do
      expect(described_class.new).to be_empty
    end

    it "returns false when there are elements" do
      expect(described_class.new([1])).to_not be_empty
    end
  end

  describe "#add" do
    it "can add an element when the heap is empty" do
      heap = described_class.new
      heap.add(1)
      expect(heap.peak).to eq 1
    end
  end
end
