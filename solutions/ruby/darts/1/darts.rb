class Darts

  TP = TARGET_POINTS = {
        ..1  => 10,
     1.1..5  => 5,
     5.1..10 => 1,
    10.1..   => 0
  }

  private_constant :TP

  private

  def initialize(x, y)
    @gipotenuza = Math.sqrt(x**2 + y**2).ceil
  end

  public

  def score
    TP.select { |range, point| range.cover?(@gipotenuza) }.values.first || 0
  end

end