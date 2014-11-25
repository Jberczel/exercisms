class Element
  class << self
    def to_a(element)
       return [] if element.nil?
      [element.datum] + to_a(element.next)
    end

    def from_a(elements)
      elements.to_a.reverse.inject(nil) do |next_node, val|
        new(val, next_node)
      end
    end
  end

  attr_reader :datum, :next

  def initialize(value, next_node)
    @datum, @next = value, next_node
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end

  def to_a
    self.class.to_a(self)
  end
end
