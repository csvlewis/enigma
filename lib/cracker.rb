require './lib/key'

class Cracker
  attr_reader :alphabet,
              :message_array,
              :last_characters,
              :offset,
              :shifts,
              :key
  def initialize(message, offset)
    @alphabet = ("a".."z").to_a << " "
    @message_array = message.split("")
    @last_characters = @message_array[-4..-1]
    @offset = offset
    @shifts = []
    @key = nil
  end

  def crack
    gather_shifts
    rotate_shifts
    subtract_offsets
    @key = generate_key
  end

  def gather_shifts
    @shifts << calculate_shift(@last_characters[0], " ")
    @shifts << calculate_shift(@last_characters[1], "e")
    @shifts << calculate_shift(@last_characters[2], "n")
    @shifts << calculate_shift(@last_characters[3], "d")
  end

  def rotate_shifts
    if @message_array.count % 4 == 0
    elsif @message_array.count % 4 == 3
      @shifts = @shifts.rotate
    elsif @message_array.count % 4 == 2
      @shifts = @shifts.rotate.rotate
    elsif @message_array.count % 4 == 1
      @shifts = @shifts.rotate.rotate.rotate
    end
  end

  def calculate_shift(encrypted, original)
    shift = @alphabet.index(encrypted) - @alphabet.index(original)
    if shift < 1
      shift + 27
    else
      shift
    end
  end

  def subtract_offsets
    @shifts[0] = @shifts[0] - @offset.offset_a
    @shifts[1] = @shifts[1] - @offset.offset_b
    @shifts[2] = @shifts[2] - @offset.offset_c
    @shifts[3] = @shifts[3] - @offset.offset_d
  end

  def generate_key
    loop do
      key = Key.new(rand(10 ** 5).to_s.rjust(5,'0'))
      if key.subkey_a % 27 == @shifts[0] &&
         key.subkey_b % 27 == @shifts[1] &&
         key.subkey_c % 27 == @shifts[2] &&
         key.subkey_d % 27 == @shifts[3]
        return key
      else
        next
      end
    end
  end
end
