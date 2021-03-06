require './test/test_helper'
require './lib/encryptor'
require './lib/key'
require './lib/offset'

class EncryptorTest < Minitest::Test
  def test_it_exists
    key = Key.new("02715")
    offset = Offset.new("040895")
    encryptor = Encryptor.new("hello world!", key, offset)

    assert_instance_of Encryptor, encryptor
  end

  def test_it_has_attributes
    key = Key.new("02715")
    offset = Offset.new("040895")
    encryptor = Encryptor.new("hello world!", key, offset)
    array = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "!"]

    assert_equal ("a".."z").to_a << " ", encryptor.alphabet
    assert_equal 3, encryptor.shift_a
    assert_equal 27, encryptor.shift_b
    assert_equal 73, encryptor.shift_c
    assert_equal 20, encryptor.shift_d
    assert_equal array, encryptor.message_array
    assert_equal [], encryptor.new_message
    assert_equal 0, encryptor.loop_num
    assert_equal 0, encryptor.shift_num
  end


  def test_it_can_encrypt_messages
    key = Key.new("02715")
    offset = Offset.new("040895")
    encryptor = Encryptor.new("hello world!", key, offset)
    encryptor.encrypt

    assert_equal "keder ohulw!", encryptor.new_message.join("")
  end

  def test_it_can_decrypt_messages
    key = Key.new("02715")
    offset = Offset.new("040895")
    encryptor = Encryptor.new("keder ohulw!", key, offset)
    encryptor.decrypt

    assert_equal "hello world!", encryptor.new_message.join("")
  end

  def test_increase_shift_and_loop_count
    key = Key.new("02715")
    offset = Offset.new("040895")
    encryptor = Encryptor.new("hello world!", key, offset)

    assert_equal 0, encryptor.loop_num
    assert_equal 0, encryptor.shift_num

    encryptor.increase_count
    encryptor.increase_count
    encryptor.increase_count
    encryptor.increase_count

    assert_equal 4, encryptor.loop_num
    assert_equal 0, encryptor.shift_num
  end
end
