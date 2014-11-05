  NUMBERS = {
    " _ " +
    "| |" +
    "|_|" => "0",

    "   " +
    "  |" +
    "  |" => "1",

    " _ " +
    " _|" +
    "|_ " => "2",

    " _ " +
    " _|" +
    " _|" => "3",

    "   " +
    "|_|" +
    "  |" => "4",

    " _ " +
    "|_ " +
    " _|" => "5",

    " _ " +
    "|_ " +
    "|_|" => "6",

    " _ " +
    "  |" +
    "  |" => "7",

    " _ " +
    "|_|" +
    "|_|" => "8",

    " _ " +
    "|_|" +
    " _|" => "9"
  }

class OCR
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def convert

    str = ''
    single_numbers.each do |s_num|
      str << NUMBERS.fetch(s_num, "?")
    end
    str
  end

  def convert2

  end

  def block_rows
    text.split(/\n\s+\n/)
  end

    # parse each string line and split into chunks of 3
  def parse_text
    text.split("\n").map { |r| r.scan(/.../) }
  end

  # get each number from 4 lines of string
  def single_numbers
    top, mid, bot, blank = parse_text
    top.zip(mid, bot).map(&:join)
  end



end

  text = <<-NUMBER.chomp
    _ 
  | _|
  ||_ 
                              
    NUMBER

#p text.delete("\n")[0..-4]



#p OCR.new(text).single_numbers.first

 text = <<-NUMBER.chomp
    _  _ 
  | _| _|
  ||_  _|
         
    _  _ 
|_||_ |_ 
  | _||_|
         
 _  _  _ 
  ||_||_|
  ||_| _|
         
NUMBER

#p text
puts OCR.new(text).convert

