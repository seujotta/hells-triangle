require "./lib/validation-messages"

module Enumerable
  def sorted_by?
    each_cons(2).all? { |a, b| (a <=> b) <= 0 }
  end
end

class Validations
  def initialize(triangle)
    @triangle = triangle
    self.validate
  end

  def validate
    raise Exception, ValidationMessages::INITIALIZE_WITH_NULL_INPUT \
          if @triangle.nil? || @triangle.size == 0

    raise Exception, ValidationMessages::INITIALIZE_WITH_NOT_ARRAY \
          if @triangle.class != Array

    raise Exception, ValidationMessages::INITIALIZE_WITH_NOT_ARRAY_ELEMENTS \
          if @triangle.all? { |itens| itens.is_a? Array } == false

    raise Exception, ValidationMessages::INITIALIZE_WITH_NOT_INTEGER_ELEMENTS \
          if @triangle.all? { |itens| itens.all? { |value| value.is_a? Integer } } == false

    @size_of_elements = []
    @triangle.each { |a| @size_of_elements << a.size  }
    raise Exception, ValidationMessages::INITIALIZE_WITH_SIZE_ORDER_ELEMENTS \
          if not @size_of_elements.sorted_by?
  end
end
