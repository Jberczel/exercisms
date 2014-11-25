require 'minitest/autorun'
require_relative 'scale'

class ScaleGeneratorTest < MiniTest::Unit::TestCase
  def test_naming_scale
    chromatic = Scale.new('c', :chromatic)
    expected = 'C chromatic'
    actual = chromatic.name
    assert_equal expected, actual
  end

  def test_chromatic_scale
   
    chromatic = Scale.new('C', :chromatic)
    expected = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B']
    actual = chromatic.pitches
    assert_equal expected, actual
  end

  def test_another_chromatic_scale

    chromatic = Scale.new('F', :chromatic)
    expected = ['F', 'Gb', 'G', 'Ab', 'A', 'Bb', 'B', 'C', 'Db', 'D', 'Eb', 'E']
    actual = chromatic.pitches
    assert_equal expected, actual
  end

  def test_major_scale

    major = Scale.new('C', :major, 'MMmMMMm')
    expected = ['C', 'D', 'E', 'F', 'G', 'A', 'B']
    actual = major.pitches
    assert_equal expected, actual
  end

  def test_another_major_scale

    major = Scale.new('G', :major, 'MMmMMMm')
    expected = ['G', 'A', 'B', 'C', 'D', 'E', 'F#']
    actual = major.pitches
    assert_equal expected, actual
  end

  def test_minor_scale

    minor = Scale.new('f#', :minor, 'MmMMmMM')
    expected = ['F#', 'G#', 'A', 'B', 'C#', 'D', 'E']
    actual = minor.pitches
    assert_equal expected, actual
  end

  def test_another_minor_scale

    minor = Scale.new('bb', :minor, 'MmMMmMM')
    expected = ['Bb', 'C', 'Db', 'Eb', 'F', 'Gb', 'Ab']
    actual = minor.pitches
    assert_equal expected, actual
  end

  def test_dorian_mode

    dorian = Scale.new('d', :dorian, 'MmMMMmM')
    expected = ['D', 'E', 'F', 'G', 'A', 'B', 'C']
    actual = dorian.pitches
    assert_equal expected, actual
  end

  def test_mixolydian_mode
   
    mixolydian = Scale.new('Eb', :mixolydian, 'MMmMMmM')
    expected = ['Eb', 'F', 'G', 'Ab', 'Bb', 'C', 'Db']
    actual = mixolydian.pitches
    assert_equal expected, actual
  end

  def test_lydian_mode

    lydian = Scale.new('a', :lydian, 'MMMmMMm')
    expected = ['A', 'B', 'C#', 'D#', 'E', 'F#', 'G#']
    actual = lydian.pitches
    assert_equal expected, actual
  end

  def test_phrygian_mode

    phrygian = Scale.new('e', :phrygian, 'mMMMmMM')
    expected = ['E', 'F', 'G', 'A', 'B', 'C', 'D']
    actual = phrygian.pitches
    assert_equal expected, actual
  end

  def test_locrian_mode

    locrian = Scale.new('g', :locrian, 'mMMmMMM')
    expected = ['G', 'Ab', 'Bb', 'C', 'Db', 'Eb', 'F']
    actual = locrian.pitches
    assert_equal expected, actual
  end

  def test_harmonic_minor

    harmonic_minor = Scale.new('d', 'harmonic_minor', 'MmMMmAm')
    expected = ['D', 'E', 'F', 'G', 'A', 'Bb', 'Db']
    actual = harmonic_minor.pitches
    assert_equal expected, actual
  end

  def test_octatonic

    octatonic = Scale.new('C', :octatonic, 'MmMmMmMm')
    expected = ['C', 'D', 'D#', 'F', 'F#', 'G#', 'A', 'B']
    actual = octatonic.pitches
    assert_equal expected, actual
  end

  def test_hexatonic
  
    hexatonic = Scale.new('Db', :hexatonic, 'MMMMMM')
    expected = ['Db', 'Eb', 'F', 'G', 'A', 'B']
    actual = hexatonic.pitches
    assert_equal expected, actual
  end

  def test_pentatonic
  
    pentatonic = Scale.new('A', :pentatonic, 'MMAMA')
    expected = ['A', 'B', 'C#', 'E', 'F#']
    actual = pentatonic.pitches
    assert_equal expected, actual
  end

  def test_enigmatic
  
    enigmatic = Scale.new('G', :enigma, 'mAMMMmM')
    expected = ['G', 'G#', 'B', 'C#', 'D#', 'F', 'F#']
    actual = enigmatic.pitches
    assert_equal expected, actual
  end

end

