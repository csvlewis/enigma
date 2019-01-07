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
end
