class Matrix

  def row(index)
    rows[index-1]
  end

  def column(index)
    rows.count.times.map { |i| row(i+1)[index-1] }
  end

  private

  attr_reader :rows

  def initialize(matrixs)
    @rows = matrixs.split(/\n/).map { |r| r.split.map(&:to_i) }
  end
  
end