require './test/test_helper'
require './lib/cracker'
require './lib/key'
require './lib/offset'

class CrackerTest < Minitest::Test
  def test_it_exists
    offset = Offset.new("040895")
    cracker = Cracker.new("keder ohulw!", offset)

    assert_instance_of Cracker, cracker
  end

  def test_it_can_crack_key_with_a_date
    offset = Offset.new("040895")
    cracker = Cracker.new("keder ohulw!", offset)
    cracker.crack

    assert_equal "02715", cracker.key
  end

  def test_it_can_crack_key_with_todays_date
    enigma = Engima.new
    encrypted = enigma.encrypt("hello world!")
    cracker = Cracker.new(encrypted[:encryption])
    cracker.crack

    assert_equal encrypted[:key], cracker.key
  end
end
