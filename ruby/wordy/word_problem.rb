class WordProblem
  attr_reader :text

  def initialize(text)
    @text = text
    validate_operators
    validate_numbers
  end

  def answer
    ops = operators.dup
    numbers.drop(1).reduce(numbers.first) do |a,b|
      operator = ops.shift
      calculate.fetch(operator)[a,b]
    end
  end

  OPERATORS = /plus|minus|multiplied|divided|raised/

  def operators
    @operators ||= text.scan(OPERATORS).map(&:to_sym)
  end

  def numbers
    @numbers ||= text.scan(/-?\d+/).map(&:to_i)
  end

  def calculate
    {
      :plus       => lambda { |a,b| a + b },
      :minus      => lambda { |a,b| a - b },
      :multiplied => lambda { |a,b| a * b },
      :divided    => lambda { |a,b| a / b },
      :raised     => lambda { |a,b| a **b  }
    }
  end

  private

  def validate_operators
    raise ArgumentError if operators.empty?
  end

  def validate_numbers
    raise ArgumentError if numbers.empty?
  end
end

    display = -> (question) do
      wp = WordProblem.new(question)
      printf("%10s %s\n", "Question:", question)
      printf("%10s %s\n", "Solution:", wp.answer)
      printf("%10s %s\n", "Numbers:", wp.numbers)
      printf("%10s %s\n\n", "Operators:", wp.operators)
    end

    display["5 plus 6?"]
    display["10 multiplied 5 divided by 2?"]
    display["2 raised 6th power?"]

#  Question: 5 plus 6?
#  Solution: 11
#   Numbers: [5, 6]
# Operators: [:plus]

#  Question: 10 multiplied 5 divided by 2?
#  Solution: 25
#   Numbers: [10, 5, 2]
# Operators: [:multiplied, :divided]

#  Question: 2 raised 6th power?
#  Solution: 64
#   Numbers: [2, 6]
# Operators: [:raised]
