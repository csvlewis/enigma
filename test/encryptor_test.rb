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
end
