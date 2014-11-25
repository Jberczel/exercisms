class Luhn
  attr_reader :number

  class << self
    def create(number)
      input = new(number)
      input.valid? ? number : input.convert_to_luhn
    end
  end

  def initialize(number)
    @number = number  
  end

  def addends
    digits.reverse.each_with_index.map do |digit, index|
      index.odd? ? encode(digit) : digit
    end.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    (checksum % 10).zero?
  end

  def convert_to_luhn
    num = self.class.new(number * 10)
    add_digit = num.valid? ? 0 : (10 - num.checksum % 10)
    (digits << add_digit).join.to_i
  end

  private

  def digits
    number.to_s.chars.map(&:to_i)
  end

  def encode(digit)
    times_two = digit * 2
    times_two > 9 ? (times_two - 9) : times_two
  end
end
