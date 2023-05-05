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
    expect(subject.weight(2, 4)).to eq(5)
  end

  it "raises an error when a vertex is out of bounds" do
    edges[0][0] = 6
    expect { subject }.to raise_error(ArgumentError)
  end
end
