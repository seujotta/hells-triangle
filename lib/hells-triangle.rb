require "./lib/validations"

class HellTriangle
  def initialize(triangle)
    @triangle = triangle
    Validations.new(@triangle)
  end

  def maximum_total
    summed_up = @triangle.first.first
    prev_index = 0
    @triangle[1..-1].each do |item|
      nearest_indexes = item.each_index.select{ |i| i >= prev_index and i <= (prev_index+1) }
      nearest_values = item.values_at(nearest_indexes[0], nearest_indexes[1])
      max_index = nearest_values.index(nearest_values.max)
      summed_up = summed_up + nearest_values[max_index]
      prev_index = nearest_indexes[max_index]
    end
    summed_up
  end

end
