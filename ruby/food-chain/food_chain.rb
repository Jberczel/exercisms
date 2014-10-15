class FoodChainSong

  ANIMALS = { 1 => 'fly', 2 => 'spider', 3 => 'bird', 4 => 'cat', 5 => 'dog' }



 def verse(num)
  animal = ANIMALS[num]
  lyrics = ''
  lyrics << "I know an old lady who swallowed a #{animal}.\n"
  lyrics <<  "What a hog, to swallow a dog!\n" if num == 5
  lyrics <<  "She swallowed the dog to catch the cat.\n" if num >= 5
  lyrics << "Imagine that, to swallow a cat!\n" if num == 4
  lyrics << "She swallowed the cat to catch the bird.\n" if num >= 4
  lyrics << "How absurd to swallow a bird!\n" if num == 3
  lyrics << "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" if num >= 3
  lyrics << "It wriggled and jiggled and tickled inside her.\n" if num == 2
  lyrics << "She swallowed the spider to catch the fly.\n" if num >= 2
  lyrics <<"I don't know why she swallowed the fly. Perhaps she'll die.\n"
  lyrics
 end


end
    

puts FoodChainSong.new.verse(4)