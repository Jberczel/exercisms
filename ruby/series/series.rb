class Series
  attr_reader :series, :length

  def initialize(series)
    @series = series
    @length = series.length  
  end

  def slices(n)
    raise ArgumentError if n > length
    0.upto(length-n).map do |i|
      i.upto(i+n-1).map { |char| series[char].to_i }
    end
  end
end

