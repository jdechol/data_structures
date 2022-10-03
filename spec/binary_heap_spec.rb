require 'binary_heap'

RSpec.describe BinaryHeap do

  subject { described_class.new }

  describe "#find_max" do
		it "returns nil when the heap is empty" do
      expect(subject).to be_empty
			expect(subject.find_max).to eq nil
		end
  end

  describe "#empty" do
    it "returns true when there are no elements" do
      expect(subject).to be_empty
    end
	end
end
