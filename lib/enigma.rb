class Enigma
  def encrypt(message, key = rand(10 ** 5).to_s.rjust(5,'0'), date = Time.now.strftime("%d%m%y"))
    key = Key.new(key)
    date = Date.new(date)
    alphabet = ("a".."z").to_a << " "
    shift_a = key.subkey_a + date.offset_a
    shift_b = key.subkey_b + date.offset_b
    shift_c = key.subkey_c + date.offset_c
    shift_d = key.subkey_d + date.offset_d
    message = message.split("")
    new_message = []
    loop_num = 0
    shift_num = 0
    until message[loop_num].nil? do
      letter = message[loop_num]
      index = alphabet.index(letter.downcase)
      if index.nil?
        new_letter = letter
      else
        if shift_num == 0
          new_letter = alphabet.rotate(shift_a)[index]
        elsif shift_num == 1
          new_letter = alphabet.rotate(shift_b)[index]
        elsif shift_num == 2
          new_letter = alphabet.rotate(shift_c)[index]
        elsif shift_num == 3
          new_letter = alphabet.rotate(shift_d)[index]
        end
      end
      new_message << new_letter
      loop_num += 1
      shift_num += 1
      if shift_num > 3
        shift_num = 0
      end
      new_message
    end
    new_message = new_message.join("")
    hash = {
    encryption: new_message,
    key: key.key,
    date: date.date
  }
    hash
  end

  def decrypt(message, key, date = Time.now.strftime("%d%m%y"))
    key = Key.new(key)
    date = Date.new(date)
    alphabet = ("a".."z").to_a << " "
    shift_a = key.subkey_a + date.offset_a
    shift_b = key.subkey_b + date.offset_b
    shift_c = key.subkey_c + date.offset_c
    shift_d = key.subkey_d + date.offset_d
    message = message.split("")
    new_message = []
    loop_num = 0
    shift_num = 0
    until message[loop_num].nil? do
      letter = message[loop_num]
      index = alphabet.index(letter.downcase)
      if index.nil?
        new_letter = letter
      else
        if shift_num == 0
          new_letter = alphabet.rotate(-shift_a)[index]
        elsif shift_num == 1
          new_letter = alphabet.rotate(-shift_b)[index]
        elsif shift_num == 2
          new_letter = alphabet.rotate(-shift_c)[index]
        elsif shift_num == 3
          new_letter = alphabet.rotate(-shift_d)[index]
        end
      end
      new_message << new_letter
      loop_num += 1
      shift_num += 1
      if shift_num > 3
        shift_num = 0
      end
      new_message
    end
    new_message = new_message.join("")
    hash = {
    decryption: new_message,
    key: key.key,
    date: date.date
  }
    hash
  end
end
