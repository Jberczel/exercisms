class Nucleotide

  NUCLEOTIDES = %w(A T C G)

  class << self
    alias_method :from_dna, :new
  end

  def initialize(strand)
    raise ArgumentError if strand[/[^ATCG]/]
    @strand = strand
  end

  def count(nucleotide)
    @strand.count(nucleotide)
  end

  def histogram
    Hash[NUCLEOTIDES.map { |i| [i, count(i)] }]
  end
end
