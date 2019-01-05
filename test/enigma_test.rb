require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_messages_with_key_and_date
    enigma = Enigma.new
    hash = {
    encryption: "keder ohulw!",
    key: "02715",
    date: "040895"
  }
  
    assert_equal hash, enigma.encrypt("hello world!", "02715", "040895")
  end
end
