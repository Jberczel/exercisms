class Scrabble




  def initialize word
    @word = word
  end




end

points = [
  [ %w(A E I O U L N R S T), 1 ],
  [ %w(D G), 2 ],
  [ %w(B C M P), 3 ],
  [ %w(F H V W Y),4 ],
  [ %w(K),5 ],
  [ %w(J X), 8 ],
  [ %w(Q Z), 10 ]
  ]

SCORES = points.inject({}) do |h, i|
      letters = i[0]
      points  = i[1]
      ary = letters.zip [points] * letters.size
      h.merge!(Hash[ary])
    end

SCORING = {"A"=>1, "E"=>1, "I"=>1, "O"=>1, "U"=>1, "L"=>1, "N"=>1, "R"=>1, 
           "S"=>1, "T"=>1, "D"=>2, "G"=>2, "B"=>3, "C"=>3, "M"=>3, "P"=>3, 
           "F"=>4, "H"=>4, "V"=>4, "W"=>4, "Y"=>4, "K"=>5, "J"=>8, "X"=>8, 
           "Q"=>10, "Z"=>10}
