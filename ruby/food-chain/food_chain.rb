class FoodChainSong

  VERSE = {   
            1 => { :animal => 'fly',    :phrase => ""},
            2 => { :animal => 'spider', :phrase => "It wriggled and jiggled and tickled inside her.\n"}, 
            3 => { :animal => 'bird',   :phrase => "How absurd to swallow a bird!\n"},
            4 => { :animal => 'cat',    :phrase => "Imagine that, to swallow a cat!\n"},
            5 => {:animal => 'dog',     :phrase => "What a hog, to swallow a dog!\n"},
            6 => { :animal => 'goat',   :phrase => "Just opened her throat and swallowed a goat!\n"},
            7 => {:animal => 'cow',     :phrase => "I don't know how she swallowed a cow!\n"},
            8 => { :animal => 'horse',  :phrase => "She's dead, of course!\n"}
          }

  def verse(num)
    animal, unique_phrase = VERSE[num][:animal], VERSE[num][:phrase]

    # unique lines
    lyrics = "I know an old lady who swallowed a #{animal}.\n"
    lyrics << unique_phrase
    return lyrics if animal == "horse" # end of verse if animal eq horse

    # repeating lines
    num.downto(2) do |i|
      lyrics << "She swallowed the #{VERSE[i][:animal]} to catch the #{VERSE[i-1][:animal]}"
      lyrics << " that wriggled and jiggled and tickled inside her" if VERSE[i][:animal] == "bird"
      lyrics << ".\n"
    end

    lyrics <<"I don't know why she swallowed the fly. Perhaps she'll die.\n"
    lyrics
  end

  def verses(from, to)
    (from..to).inject("") { |v, n| v << verse(n) + "\n" }
  end

  def sing
    verses(1,8)
  end
end

