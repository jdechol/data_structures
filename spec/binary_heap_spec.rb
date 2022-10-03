require 'binary_heap'

RSpec.describe BinaryHeap do
  describe "#peak" do
		it "returns nil when the heap is empty" do
      expect(described_class.new).to be_empty
			expect(subject.peak).to eq nil
    end

    it "returns the element when there is only one element" do
      expect(described_class.new([1]).peak).to eq 1
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
end
