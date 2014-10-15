class Squares
  attr_reader :nums

  def initialize(count)
    @nums = 1..count
  end

  def sum_of_squares
    nums.inject(0) { |sum, i| sum + i**2 }
  end

  def square_of_sums
    nums.inject(0) { |sum, i| sum + i }**2
  end

  def difference
    square_of_sums - sum_of_squares
    #(sum_of_squares - square_of_sums).abs
  end
end


