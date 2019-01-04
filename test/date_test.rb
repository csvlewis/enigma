require './test/test_helper'
require './lib/date'

class DateTest < Minitest::Test
  def test_it_exists
    date = Date.new("040895")

    assert_instance_of Date, date
  end

  def test_it_has_a_date
    date = Date.new("040895")

    assert_equal "040895", date.date
  end

  def test_it_has_a_square
    date = Date.new("040895")

    assert_equal 1672401025, date.square
  end

  def test_it_has_digits
    date = Date.new("040895")

    assert_equal "1025", date.digits
  end

  def test_it_has_four_offsets
    date = Date.new("040895")

    assert_equal 1, date.offset_a
    assert_equal 0, date.offset_b
    assert_equal 2, date.offset_c
    assert_equal 5, date.offset_d
  end
end
