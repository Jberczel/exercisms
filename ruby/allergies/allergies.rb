class Allergies
  attr_reader :score

  def initialize(score)
    @score = score
  end

  def allergic_to?(item)
    list.include?(item)
  end

  def list
    tmp = score
    # @list ||= LOOKUP.take_while { |item| item[1] <= score }
    #                 .map { |item| item[0] }  # retrieve only item names, not scores
    ary = []
    LOOKUP.each do |item|
      if tmp >= item[1]
        ary.unshift item[0]
        tmp = tmp % item[1]
      end
    end
    ary
  end

end

LOOKUP = [["cats", 128], ["pollen", 64], ["chocolate", 32], ["tomatoes", 16],
          ["strawberries", 8], ["shellfish", 4], ["peanuts", 2], ["eggs", 1]]



p Allergies.new(509).list

