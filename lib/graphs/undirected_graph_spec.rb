require 'graphs/undirected_graph'
require 'ostruct'

describe Graphs::UndirectedGraph do
  let(:size) { 6 }
  let(:edges) {
    [
      OpenStruct.new(left: 1, right: 3, weight: 7),
      OpenStruct.new(left: 2, right: 4, weight: 5),
      OpenStruct.new(left: 1, right: 2, weight: 4),
      OpenStruct.new(left: 5, right: 5, weight: 20),
    ]
  }

  subject { described_class.new(size, edges) }

  it "builds a graph" do
    expect(subject.edge_weight(2, 4)).to eq(5)
  end

  it "initializes non_edges with nil" do
    expect(subject.edge_weight(5, 4)).to eq nil
  end

  describe "#add_edge" do
    it "adds an edge" do
      subject.add_edge(1, 1, 2)
      expect(subject.edge_weight(1, 1)).to eq 2
    end

    it "raises an error when a vertex is out of bounds" do
      expect { subject.add_edge(size, 1, 1) }.to raise_error(ArgumentError)
    end
  end

  describe "#remove_edge" do
    it "removes an edge" do
      expect(subject.edge_weight(5, 5)).to_not eq 0
      subject.remove_edge(5, 5)
      expect(subject.edge_weight(5, 5)).to eq nil
    end

    it "raises an error when a vertex is out of bounds" do
      expect { subject.remove_edge(size, 1) }.to raise_error(ArgumentError)
    end
  end
end
