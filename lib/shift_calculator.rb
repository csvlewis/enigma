module ShiftCalculator
  def gather_shifts
    @shifts << calculate_shift(@last_characters[0], " ")
    @shifts << calculate_shift(@last_characters[1], "e")
    @shifts << calculate_shift(@last_characters[2], "n")
    @shifts << calculate_shift(@last_characters[3], "d")
  end

  def calculate_shift(encrypted, original)
    @alphabet.index(encrypted) - @alphabet.index(original)
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

  def subtract_offsets
    @shifts[0] = @shifts[0] - @offset.offset_a
    @shifts[1] = @shifts[1] - @offset.offset_b
    @shifts[2] = @shifts[2] - @offset.offset_c
    @shifts[3] = @shifts[3] - @offset.offset_d
  end

  def convert_negative_shifts
    @shifts.map do |shift|
      if shift.negative?
        shift + 27
      else
        shift
      end
    end
  end
end
