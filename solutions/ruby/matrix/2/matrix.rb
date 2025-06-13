class Matrix

  def rows
    @matrix.split(/\n/).map { |row| row.split.map(&:to_i) }
  end

  def columns
    columns = []
    
    rows.map(&:size).max.times do |i|
      columns << rows.map { |row| row[i] }
    end

    columns
  end

  private

  def initialize(matrix)
    @matrix = matrix
  end
  
end