require './lib/key'
require './lib/shift_calculator'

class Cracker
  include ShiftCalculator
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
    @shifts = convert_negative_shifts
    @key = generate_key
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
