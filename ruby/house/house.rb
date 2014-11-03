module House

  class << self

    def recite
      verse_1 + verse_2_12
    end

    def verse_1
      "This is the house that Jack built.\n\n"  
    end

    def verse_2_12
      unique_lines.each_with_index.map do |uniq_line, i|
        "#{uniq_line}\n#{repeating_lines[(-1-i)..-1].join("\n")}\n"
      end.join("\n")
    end

    def repeating_lines
      [ "that belonged to the farmer sowing his corn",
        "that kept the rooster that crowed in the morn",
        "that woke the priest all shaven and shorn",
        "that married the man all tattered and torn",
        "that kissed the maiden all forlorn",
        "that milked the cow with the crumpled horn",
        "that tossed the dog",
        "that worried the cat",
        "that killed the rat",
        "that ate the malt",
        "that lay in the house that Jack built."
       ]
    end

    def unique_lines
      [ "This is the malt",
        "This is the rat",
        "This is the cat",
        "This is the dog",
        "This is the cow with the crumpled horn",
        "This is the maiden all forlorn",
        "This is the man all tattered and torn",
        "This is the priest all shaven and shorn",
        "This is the rooster that crowed in the morn",
        "This is the farmer sowing his corn",
        "This is the horse and the hound and the horn" ]
    end
  end
end