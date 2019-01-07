class Cracker
  def initialize(message, offset)
    @alphabet = ("a".."z").to_a << " "
    @message_array = message.split("")
    @last_characters = @message_array[-4..-1]
    @offset = offset
    @shifts = []
  end

  def crack
    gather_shifts
    rotate_shifts
    require 'pry'; binding.pry
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
    if shift.negative?
      shift + 27
    else
      shift
    end
  end
end
