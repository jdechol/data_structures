require 'binary_heap'

RSpec.describe BinaryHeap do
  describe "#find_max" do
		it "returns nil when the heap is empty" do
      expect(described_class.new).to be_empty
			expect(subject.find_max).to eq nil
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
