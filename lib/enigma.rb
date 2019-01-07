require './lib/key'
require './lib/offset'
require './lib/encryptor'
require './lib/cracker'

class Enigma
  def encrypt(message, key = rand(10 ** 5).to_s.rjust(5,'0'), date = Time.now.strftime("%d%m%y"))
    key = Key.new(key)
    offset = Offset.new(date)
    encryptor = Encryptor.new(message, key, offset)
    encryptor.encrypt
    {
      encryption: encryptor.new_message.join(""),
      key: key.key,
      date: offset.date
    }
  end

  def decrypt(message, key, date = Time.now.strftime("%d%m%y"))
    key = Key.new(key)
    offset = Offset.new(date)
    encryptor = Encryptor.new(message, key, offset)
    encryptor.decrypt
    {
      decryption: encryptor.new_message.join(""),
      key: key.key,
      date: offset.date
    }
  end

  def crack(message, date = Time.now.strftime("%d%m%y"))
    offset = Offset.new(date)
    cracker = Cracker.new(message, offset)
    cracker.crack
    encryptor = Encryptor.new(message, cracker.key, offset)
    encryptor.decrypt
    {
      decryption: encryptor.new_message.join(""),
      date: offset.date,
      key: cracker.key.key
    }
  end
end
