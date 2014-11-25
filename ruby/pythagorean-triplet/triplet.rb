class Triplet
  attr_reader :sides

  def self.where(sum: nil, min_factor: 3, max_factor: 10)
    ary = generate_triplets(min_factor, max_factor)
    sum.nil? ? ary : ary.select { |e| e.sum == sum }
  end

  def self.generate_triplets(min, max)
    # implementation 1
    # ary = []
    # min.upto(max) do |c|
    #   min.upto(c) do |b|
    #     min.upto(b) do |a|
    #       t = new(a,b,c)
    #       ary << t if t.pythagorean?
    #     end
    #   end
    # end
    # ary
    ary = []
    min.upto(max) do |a|
      a.upto(max) do |b|
        c = Math.sqrt(a**2 + b**2)
        # check if whole number and c is also less than or equal to max
        if c % 1 == 0 && c <= max
          ary << new(a, b, c.to_i)
        end
      end
    end
    ary
  end

  def initialize(*sides)
    @sides = sides.sort
  end

  def sum
    sides.reduce(:+)
  end

  def product
    sides.reduce(:*)
  end

  def pythagorean?
    max = sides.last
    sides.first(2).reduce(0) { |sum,s| sum + s**2 } == max**2
  end
end