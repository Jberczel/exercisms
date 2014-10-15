module Prime

  def self.nth(index)
    counter, num = 0, 0
    until counter == index
      num += 1
      counter  += 1 if isPrime(num)
    end
    num
  end

  def self.isPrime(n)
    return false if n < 2
    # check if n cannot be evenly divisible with any number down to 2
    (n-1).downto(2).none? { |i| n % i == 0 }
  end

end


puts Prime.nth(4)
