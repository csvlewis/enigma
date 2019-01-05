class Encryptor
  attr_reader :shift_a,
              :shift_b,
              :shift_c,
              :shift_d,
              :message_array
  def initialize(message, key, date)
    @shift_a = key.subkey_a + date.offset_a
    @shift_b = key.subkey_b + date.offset_b
    @shift_c = key.subkey_c + date.offset_c
    @shift_d = key.subkey_d + date.offset_d
    @message_array = message.split("")
  end

  def encrypt
  end

  def decrypt
  end
end
