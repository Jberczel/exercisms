class Say
  attr_reader :num

  UNDER_20    = %w(zero one two three four five six seven eight nine) +
                %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

  UNDER_100   = %w(zero ten twenty thirty forty fifty sixty seventy eighty ninety)

  LARGE_UNITS = ['billion', 'million', 'thousand', 'hundred'].zip [10**9, 10**6, 1000, 100]

  def initialize(num)
    raise ArgumentError unless num.between?(0, (10**12)-1)
    @num = num
  end

  def in_english
    num_to_words(num)
  end

  private

  def num_to_words(num)
    return under_20_word(num)  if num < 20
    return under_100_word(num) if num < 100
    large_word(num)
  end

  def under_20_word(num)
    UNDER_20[num]
  end

  def under_100_word(num)
    output = []
    occurences, left_over = num.divmod(10)
    output << UNDER_100[occurences]
    output <<  UNDER_20[left_over] unless left_over.zero?
    output.join('-')
  end

  def large_word(num)
    output = []
    LARGE_UNITS.each do |word, value|
      next if num < value
      occurences, num = num.divmod(value)
      output << "#{num_to_words(occurences)} #{word}"
    end
    output << num_to_words(num) unless num.zero?  
    output.join(' ')
  end
end