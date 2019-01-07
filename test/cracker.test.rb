require './test/test_helper'
require './lib/cracker'
require './lib/key'
require './lib/offset'

class CrackerTest < Minitest::Test
  def test_it_exists
    offset = Offset.new("040895")
    cracker = Cracker.new("keder ohulw!", offset)
    cracker.crack

    assert_equal "02715", cracker.key
  end
end
