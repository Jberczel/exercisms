GRAMMAR={
  '1 tens'     => 'ten'      , '2 tens'     => 'twenty'  , '3 tens'     => 'thirty'  ,
  '4 tens'     => 'fourty'   , '5 tens'     => 'fifty'   , '6 tens'     => 'sixty'   ,
  '7 tens'     => 'seventy'  , '8 tens'     => 'eighty'  , '9 tens'     => 'ninety'  ,
  'ten 1 ones' => 'eleven'   , 'ten 2 ones' => 'twelve'  , 'ten 3 ones' => 'thirteen',
  'ten 4 ones' => 'fourteen' , 'ten 5 ones' => 'fifteen' , 'ten 6 ones' => 'sixteen' ,
  'ten 7 ones' => 'seventeen', 'ten 8 ones' => 'eighteen', 'ten 9 ones' => 'nineteen',
  '1 ones'     => 'one'      , '2 ones'     => 'two'     , '3 ones'     => 'three'   ,
  '4 ones'     => 'four'     , '5 ones'     => 'five'    , '6 ones'     => 'six'     ,
  '7 ones'     => 'seven'    , '8 ones'     => 'eight'   , '9 ones'     => 'nine'    ,
  }

UNITS=['ones million','ones hundred','tens','ones thousand','ones hundred','tens','ones']

def in_words(n)
  raise ArgumentError, "n = #{n} is not a Fixnum" unless n.is_a? Fixnum
  raise ArgumentError, "n = #{n} not >= 0 and < 10,000,000" if n < 0 || n >= 10_000_000
  return "zero" if n.zero?
  y = 1_000_000
  str = UNITS.each_with_object('') do |t,str|
    x, n = n.divmod(y)
    str << " #{x} #{t}" if x > 0
    y /= 10
  end.lstrip!
  GRAMMAR.each { |k,v| str.gsub!(k,v) }
  str
end

puts in_words(3_464_284)
# => three million four hundred sixty four thousand two hundred eighty four
# str before LABELS.each ...