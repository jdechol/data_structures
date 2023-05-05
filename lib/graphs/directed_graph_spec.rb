require 'graphs/directed_graph'

describe Graphs::DirectedGraph do
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

  def build_edge(from, to, weight)
    { from: from, to: to, weight: weight }
  end

  it "builds an undirected graph" do
    edges.each do |edge|
      expect(subject.edge_weight(from: edge[:from], to: edge[:to])).to eq edge[:weight]
      expect(subject.edge_weight(to: edge[:from], from: edge[:to])).to eq edge[:weight]
    end
  end

  it "initializes non_edges with nil" do
    expect(subject.edge_weight(from: 5, to: 4)).to eq nil
  end

  describe "#add_edge" do
    it "adds an edge" do
      subject.add_edge(from: 1, to: 1, weight: 2)
      expect(subject.edge_weight(from: 1, to: 1)).to eq 2
    end

    it "raises an error when a vertex is out of bounds" do
      expect { subject.add_edge(from: size, to: 1, weight: 1) }.to raise_error(ArgumentError)
    end
  end

  describe "#remove_edge" do
    it "removes an edge" do
      expect(subject.edge_weight(from: 5, to: 5)).to_not eq 0
      subject.remove_edge(from: 5, to: 5)
      expect(subject.edge_weight(from: 5, to: 5)).to eq nil
    end

    it "raises an error when a vertex is out of bounds" do
      expect { subject.remove_edge(from: size, to: 1) }.to raise_error(ArgumentError)
    end
  end
end
