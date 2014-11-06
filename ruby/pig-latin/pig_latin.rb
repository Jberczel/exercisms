module PigLatin
  class << self

    CASES = ['ch', 'qu', 'squ', 'thr', 'th', 'sch']

    def special_cases(word)
      CASES.each do |c|
        return to_pig_latin(word, c.length) if word.start_with?(c)
      end
    end

    def translate(text)
      text.split.map { |w| translate_single(w) }.join(' ')
    end

    def translate_single(word)
      first_letter = word[0]
      if first_letter =~/[aeiou]/ || word.start_with?("yt", "xr")
        return word += "ay"
      elsif word.start_with?(*CASES)
        return special_cases(word)
      else
        return to_pig_latin(word, 1)
      end
    end


    def to_pig_latin(word, count)
      first_chars = word[0...count]
      word[count..-1] + first_chars + "ay"
    end
  end
end






puts PigLatin.translate("chair")