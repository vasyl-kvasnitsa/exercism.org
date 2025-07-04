class Darts

  TP = TARGET_POINTS = {
    1  => 10,
    5  => 5,
    10 => 1
  }

  DISTANCE = ->(x, y) { Math.sqrt x**2 + y**2 }

  private_constant :TP

  private

  attr_reader :distance_to_center

  def initialize(x, y)
    @distance_to_center = DISTANCE[x, y]
  end

  public

  def score
    TP.find { |distance, _point| distance >= distance_to_center }&.last.to_i
  end

end