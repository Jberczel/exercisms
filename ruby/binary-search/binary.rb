class BinarySearch
  attr_reader :list

  def initialize(list)
    raise ArgumentError unless list == list.sort
    @list = list
  end

  def search_for(num)
    raise RuntimeError unless list.include?(num)
    mid_val = list.fetch(middle)
    puts "middle: idx: #{middle}, val: #{mid_val}"
    if mid_val == num
      return list.index(num)
    else
      if num < mid_val
        @list = list.take(middle)
      else
        @list = list.drop(middle + 1)
      end
        puts "mid_val: #{mid_val} eql? num: #{num}"
        puts "list: #{@list}"
        search_for(num)
    end
  end

  def middle
    list.size / 2
  end
end

binary = BinarySearch.new([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377])

p binary.list
p binary.middle
puts

p binary.search_for(21)
p binary.list