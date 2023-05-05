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
end
