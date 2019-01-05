class Offset
  attr_reader :date,
              :square,
              :digits,
              :offset_a,
              :offset_b,
              :offset_c,
              :offset_d
  def initialize(date)
    @date = date
    @square = date.to_i**2
    @digits = @square.to_s[-4..-1]
    @offset_a = @digits[0].to_i
    @offset_b = @digits[1].to_i
    @offset_c = @digits[2].to_i
    @offset_d = @digits[3].to_i
  end
end
