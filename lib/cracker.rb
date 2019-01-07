class Cracker
  def initialize(message, offset)
    @alphabet = ("a".."z").to_a << " "
    @message_array = message.split("")
    @last_characters = @message_array[-4..-1]
    @offset = offset
    @letter_shifts = []
  end

  def crack
    calculate_shift(@last_characters[0], " ")
    calculate_shift(@last_characters[1], "e")
    calculate_shift(@last_characters[2], "n")
    calculate_shift(@last_characters[3], "d")

  end

  def assign_shifts
    if @message_array.count % 4 == 0
    elsif @message_array.count % 4 == 3
      @letter_shifts.rotate
    elsif @message_array.count % 4 == 2
      @letter_shifts.rotate.rotate
    elsif @message_array.count % 4 == 1
      @letter_shifts.rotate.rotate.rotate
    end
  end

  def calculate_shift(encrypted, original)
    shift = 27 - (@alphabet.index(encrypted) - @alphabet.index(original)).abs
    require 'pry'; binding.pry
  end
end
