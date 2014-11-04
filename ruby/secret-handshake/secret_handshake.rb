class SecretHandshake
  attr_reader :num, :binary

  binary =  [10000, 1000, 100, 10, 1]
  commands =%w(reverse jump close\ your\ eyes double\ blink wink)
  SECRETS = binary.zip commands

  def initialize(input)
    @num = input.kind_of?(Integer) ? input : 0
  end

  def binary
    num.to_s(2).to_i
  end

  def commands
    @commands ||= get_commands
  end

  def get_commands
    ary, tmp = [], binary
    SECRETS.each do |limit, command|
      next if limit > tmp
      tmp = tmp % limit
      ary.unshift command unless command == 'reverse'
    end
    binary >= 1000 ? ary.reverse : ary
  end
end
