class Darts

  TP = TARGET_POINTS = {
                   ..1  => 10,
     1.0.next_float..5  => 5,
     5.0.next_float..10 => 1,
    10.0.next_float..   => 0
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
    TP.find { |range, point| range.cover?(distance_to_center) }.last || 0
  end

end