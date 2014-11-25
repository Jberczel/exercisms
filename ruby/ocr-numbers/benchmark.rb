require_relative 'other_ocr'
require_relative 'ocr'

require 'benchmark'
TEST_COUNT = 1000

  text = <<-NUMBER.chomp
    _  _ 
  | _| _|
  ||_  _|
         
    _  _ 
|_||_ |_ 
  | _||_|
         
 _  _  _ 
  ||_||_|
  ||_| _|
  NUMBER


Benchmark.bmbm(5) do |b|
  b.report("myOCR") do 
    TEST_COUNT.times do |i|
      ocr = OCR.new(text).convert
    end
  end

  b.report("otherOCR") do 
  TEST_COUNT.times do |i|
    ocr = OtherOCR.new(text).convert
    end
  end
end


