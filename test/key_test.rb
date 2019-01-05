require './test/test_helper'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists
    key = Key.new("02715")

    assert_instance_of Key, key
  end

  def test_it_has_a_key
    key = Key.new("02715")

    assert_equal "02715", key.key
  end

  def test_it_has_four_subkeys
    key = Key.new("02715")

    assert_equal 02, key.subkey_a
    assert_equal 27, key.subkey_b
    assert_equal 71, key.subkey_c
    assert_equal 15, key.subkey_d
  end
end
