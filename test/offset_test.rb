require './test/test_helper'
require './lib/offset'

class OffsetTest < Minitest::Test
  def test_it_exists
    offset = Offset.new("040895")

    assert_instance_of Offset, offset
  end

  def test_it_has_a_date
    offset = Offset.new("040895")

    assert_equal "040895", offset.date
  end

  def test_it_has_a_square
    offset = Offset.new("040895")

    assert_equal 1672401025, offset.square
  end

  def test_it_has_digits
    offset = Offset.new("040895")

    assert_equal "1025", offset.digits
  end

  def test_it_has_four_offsets
    offset = Offset.new("040895")

    assert_equal 1, offset.offset_a
    assert_equal 0, offset.offset_b
    assert_equal 2, offset.offset_c
    assert_equal 5, offset.offset_d
  end
end
