require 'graphs/undirected_graph'

describe Graphs::UndirectedGraph do
  let(:size) { 6 }
  let(:edges) {
    [
      [1, 3, 7],
      [2, 4, 5],
      [1, 2, 4],
      [5, 5, 20]
    ]
  }

  subject { described_class.new(size, edges) }

  it "builds a graph" do
    expect(subject.edge_weight(2, 4)).to eq(5)
  end

  describe "#add_edge" do
    it "raises an error when a vertex is out of bounds" do
      expect { subject.add_edge(size, 1, 1) }.to raise_error(ArgumentError)
    end

    it "adds an edge" do
      subject.add_edge(1, 1, 2)
      expect(subject.edge_weight(1, 1)).to eq 2
    end
  end

  describe "#remove_edge" do

  end
end
