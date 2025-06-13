class Darts

  BOARD = {
    1  => 10,
    5  => 5,
    10 => 1
  }

  BOARD.default = 0

  DISTANCE = ->(x, y) { Math.sqrt x**2 + y**2 }

  private

  attr_reader :distance_to_center

  def initialize(x, y)
    @distance_to_center = DISTANCE[x, y]
  end

  public

  def score
    BOARD[BOARD.keys.find { |distance, _point| distance >= distance_to_center }]
  end

end