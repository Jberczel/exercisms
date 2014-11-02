class Palindromes
  attr_reader :max_factor, :min_factor, :factors

  def initialize(args = {})
    @max_factor = args.fetch(:max_factor)
    @min_factor = args.fetch(:min_factor, 1)
    @factors = []
  end

  def generate
    (min_factor..max_factor).each do |i|
      (i..max_factor).each do |k|        
          @factors << [i,k] if palindrome?(i*k)
      end
    end
  end

  def largest
    max = @factors.max_by { |factors| factors[0] * factors[1] }
    max = @factors.select { |factor| (factor[0] * factor[1]) == (max[0] * max[1]) } 
    PalindromeProducts.new(max)
  end

  def smallest
    min = min_max[0]
    min = @factors.select { |factor| (factor[0] * factor[1]) == (min[0] * min[1]) } 
    PalindromeProducts.new(min)
  end

  def min_max
    min, max = @factors.minmax_by { |f| f[0] * f[1] }
  end

  private

  def palindrome?(num)
    s = num.to_s
    s == s.reverse
  end
end

PalindromeProducts = Struct.new(:factors) do
  def value
    factors[0][0] * factors[0][1]
  end
end


p = Palindromes.new(max_factor: 99)

p.generate
p p.factors
p p.smallest.value
p p.largest.value
p p.min_max

