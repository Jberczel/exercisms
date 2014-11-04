class SecretHandshake
  attr_reader :num, :binary
  COMMANDS = [10000, 1000, 100, 10, 1].zip([nil] + %w(jump close\ your\ eyes double\ blink wink)) 

  def initialize(num)
    @num = num
    @binary = num.kind_of?(Integer) ? num.to_s(2).to_i : 0
  end

  def get_commands
    tmp = binary
    ary = []
    COMMANDS.each do |limit, command|
      next if limit > tmp
      tmp = tmp % limit
      ary.unshift command
    end
    ary.compact!
    binary >= 1000 ? ary.reverse : ary
  end

  def commands
    @commands ||= get_commands
  end
end

p SecretHandshake.new("pig").commands