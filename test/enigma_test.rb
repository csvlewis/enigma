require './test/test_helper'
require 'mocha/minitest'
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

    assert_equal hash, enigma.encrypt("Hello world!", "02715", "040895")
  end

  def test_it_can_decrypt_messages_with_key_and_date
    enigma = Enigma.new
    hash = {
      decryption: "hello world!",
      key: "02715",
      date: "040895"
    }

    assert_equal hash, enigma.decrypt("keder ohulw!", "02715", "040895")
  end

  def test_it_can_encrypt_and_decrypt_messages_using_todays_date
    enigma = Enigma.new
    encrypted = enigma.encrypt("Hello world!", "02715")
    hash_1 = {
      encryption: encrypted[:encryption],
      key: "02715",
      date: Time.now.strftime("%d%m%y")
    }
    hash_2 = {
      decryption: "hello world!",
      key: "02715",
      date: Time.now.strftime("%d%m%y")
    }

    assert_equal hash_1, encrypted
    assert_equal hash_2, enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_it_can_encrypt_messages_with_a_random_key_and_todays_date
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world!")
    hash = {
      encryption: encrypted[:encryption],
      key: encrypted[:key],
      date: Time.now.strftime("%d%m%y")
    }

    assert_equal hash, encrypted
  end

  def test_it_can_crack_with_a_date
    enigma = Enigma.new
    hash = {
    decryption: "hello world end",
    date: "291018",
    key: "08304"
  }

    assert_equal hash, enigma.crack("vjqtbeaweqihssi", "291018")
  end

  def test_it_can_crack_using_todays_date
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world end")
    key = mock
    key.stubs(:key).returns(encrypted[:key])
    hash = {
    decryption: "hello world end",
    date: Time.now.strftime("%d%m%y"),
    key: key.key
  }

  assert_equal hash, enigma.crack(encrypted[:encryption])
  end
end
