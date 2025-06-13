class Darts

  TP = TARGET_POINTS = {
        ..1  => 10,
     1.01..5  => 5,
     5.01..10 => 1,
    10.01..   => 0
  }

  private_constant :TP

  private

  attr_reader :gipotenuza

  def initialize(x, y)
    @gipotenuza = Math.sqrt(x**2 + y**2).ceil
  end

  public

  def score
    TP.select { |range, point| range.cover?(gipotenuza) }.values.first || 0
  end

end