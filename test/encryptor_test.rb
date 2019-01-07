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

  def test_it_has_an_alphabet
  end

  def test_it_can_calculate_shifts
  end

  def test_it_has_a_message_array
  end

  def test_it_starts_without_a_new_message
  end

  def test_loop_and_shift_num_start_at_0
  end

  def test_increase_shift_and_loop_count
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
end
