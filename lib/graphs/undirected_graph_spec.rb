require 'graphs/undirected_graph'
require 'ostruct'

describe Graphs::UndirectedGraph do
  let(:size) { 6 }
  let(:edges) {
    [
      build_edge(1, 3, 7),
      build_edge(2, 4, 5),
      build_edge(1, 2, 4),
      build_edge(5, 5, 20),
    ]
  }

  subject { described_class.new(size, edges) }

  def build_edge(left, right, weight)
    OpenStruct.new(left: left, right: right, weight: weight)
  end

  it "builds an undirected graph" do
    edges.each do |edge|
      expect(subject.edge_weight(edge.left, edge.right)).to eq edge.weight
      expect(subject.edge_weight(edge.right, edge.left)).to eq edge.weight
    end
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
