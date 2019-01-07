class Cracker
  def initialize(message, offset)
    @alphabet = ("a".."z").to_a << " "
    @message_array = message.split("")
    @last_characters = @message_array[-4..-1]
    @offset = offset
    @letter_shifts = []
  end

  def crack
    assign_shifts
    calculate_a_shift
    require 'pry'; binding.pry
  end

  def assign_shifts
    if @message_array.count % 4 == 0
      @letter_shifts = @last_characters
    elsif @message_array.count % 4 == 3
      @letter_shifts = @last_characters.rotate
    elsif @message_array.count % 4 == 2
      @letter_shifts = @last_characters.rotate.rotate
    elsif @message_array.count % 4 == 1
      @letter_shifts = @last_characters.rotate.rotate.rotate
    end
  end
end
