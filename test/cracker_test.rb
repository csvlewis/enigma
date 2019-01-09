require './test/test_helper'
require './lib/cracker'
require './lib/key'
require './lib/offset'
require './lib/enigma'

class CrackerTest < Minitest::Test
  def test_it_exists
    offset = Offset.new("291018")
    cracker = Cracker.new("vjqtbeaweqihssi", offset)

    assert_instance_of Cracker, cracker
  end

  def test_it_has_attributes
    offset = Offset.new("291018")
    cracker = Cracker.new("vjqtbeaweqihssi", offset)
    array = ["v", "j", "q", "t", "b", "e", "a", "w", "e", "q", "i", "h", "s", "s", "i"]

    assert_equal ("a".."z").to_a << " ", cracker.alphabet
    assert_equal array, cracker.message_array
    assert_equal ["h", "s", "s", "i"], cracker.last_characters
    assert_equal offset, cracker.offset
    assert_equal [], cracker.shifts
    assert_nil cracker.key
  end

  def test_it_can_crack_key_with_a_date
    offset = Offset.new("291018")
    cracker = Cracker.new("vjqtbeaweqihssi", offset)
    cracker.crack

    assert_equal "08304", cracker.key.key
  end

  def test_it_can_crack_key_with_todays_date
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world end", "08215")
    offset = Offset.new(Time.now.strftime("%d%m%y"))
    cracker = Cracker.new(encrypted[:encryption], offset)
    cracker.crack

    assert_equal encrypted[:key], cracker.key.key
  end

  def test_it_can_gather_shifts
    offset = Offset.new("291018")
    cracker = Cracker.new("vjqtbeaweqihssi", offset)

    assert_equal [], cracker.shifts

    cracker.crack

    assert_equal [8, 2, 3, 4], cracker.shifts
  end

  def test_it_can_rotate_shifts
    offset = Offset.new("010101")
    cracker_1 = Cracker.new("m gxzb", offset)
    cracker_2 = Cracker.new("mylfp", offset)

    cracker_1.gather_shifts
    cracker_2.gather_shifts

    assert_equal [-20, 19, 12, -2], cracker_1.shifts
    assert_equal [-2, 7, -8, 12], cracker_2.shifts

    cracker_1.rotate_shifts
    cracker_2.rotate_shifts

    assert_equal [12, -2, -20, 19], cracker_1.shifts
    assert_equal [12, -2, 7, -8], cracker_2.shifts
  end
end
