class Encryptor
  attr_reader :alphabet,
              :shift_a,
              :shift_b,
              :shift_c,
              :shift_d,
              :message_array,
              :new_message,
              :loop_num,
              :shift_num
  def initialize(message, key, date)
    @alphabet = ("a".."z").to_a << " "
    @shift_a = key.subkey_a + date.offset_a
    @shift_b = key.subkey_b + date.offset_b
    @shift_c = key.subkey_c + date.offset_c
    @shift_d = key.subkey_d + date.offset_d
    @positive_shifts = [@shift_a, @shift_b, @shift_c, @shift_d]
    @negative_shifts = @positive_shifts.map { |shift| -shift }
    @message_array = message.split("")
    @new_message = []
    @loop_num = 0
    @shift_num = 0
  end

  def encrypt
    until message_array[loop_num].nil? do
      letter = message_array[loop_num]
      index = @alphabet.index(letter.downcase)
      letter = apply_shift(index, @positive_shifts) unless index.nil?
      new_message << letter
      increase_count
    end
  end

  def decrypt
    until message_array[loop_num].nil? do
      letter = message_array[loop_num]
      index = @alphabet.index(letter.downcase)
      letter = apply_shift(index, @negative_shifts) unless index.nil?
      new_message << letter
      increase_count
    end
  end

  def apply_shift(index, shift_array)
    if shift_num == 0
      @alphabet.rotate(shift_array[0])[index]
    elsif shift_num == 1
      @alphabet.rotate(shift_array[1])[index]
    elsif shift_num == 2
      @alphabet.rotate(shift_array[2])[index]
    elsif shift_num == 3
      @alphabet.rotate(shift_array[3])[index]
    end
  end

  def increase_count
    @loop_num += 1
    @shift_num += 1
    if @shift_num > 3
      @shift_num = 0
    end
  end
end
