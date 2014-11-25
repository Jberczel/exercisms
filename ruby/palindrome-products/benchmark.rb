require_relative 'other_palindromes'
require_relative 'palindromes'

require 'benchmark'
TEST_COUNT = 100


Benchmark.bmbm(5) do |b|
  b.report("myPalindromes") do 
    TEST_COUNT.times do |i|
      palindromes = Palindromes::Palindromes.new(max_factor: i+1, min_factor: 1)
      palindromes.generate
      smallest = palindromes.smallest
      largest = palindromes.largest
      largest.value
      largest.factors
    end
  end

  b.report("otherPalindromes") do 
  TEST_COUNT.times do |i|
    palindromes = OtherPalindromes.new(max_factor: i+1, min_factor: 1)
    palindromes.generate
    smallest = palindromes.smallest
    largest = palindromes.largest
    largest.value
    largest.factors
    end
  end
end


