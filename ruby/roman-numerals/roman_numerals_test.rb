require 'minitest/autorun'
require_relative 'roman'

class RomanTest < MiniTest::Unit::TestCase

  def test_1
    assert_equal 'I', 1.to_roman
  end

  def test_2
    assert_equal 'II', 2.to_roman
  end

  def test_3
    assert_equal 'III', 3.to_roman
  end

  def test_4
    assert_equal 'IV', 4.to_roman
  end

  def test_5
    assert_equal 'V', 5.to_roman
  end

  def test_6

    assert_equal 'VI', 6.to_roman
  end

  def test_9
    assert_equal 'IX', 9.to_roman
  end


  def test_27
    assert_equal 'XXVII', 27.to_roman
  end

  def test_48
    assert_equal 'XLVIII', 48.to_roman
  end

  def test_59
    assert_equal 'LIX', 59.to_roman
  end

  def test_93
    assert_equal 'XCIII', 93.to_roman
  end

  def test_141
    skip
    assert_equal 'CXLI', 141.to_roman
  end

  def test_163
    skip
    assert_equal 'CLXIII', 163.to_roman
  end

  def test_402
    skip
    assert_equal 'CDII', 402.to_roman
  end

  def test_575
    skip
    assert_equal 'DLXXV', 575.to_roman
  end

  def test_911
    skip
    assert_equal 'CMXI', 911.to_roman
  end

  def test_1024
    skip
    assert_equal 'MXXIV', 1024.to_roman
  end

  def test_3000
    skip
    assert_equal 'MMM', 3000.to_roman
  end

end