require "./lib/hells-triangle"

RSpec.describe "Hells Triangle tests", :type => :request do
  describe "validations" do
    it "Initialize without passing an element as input" do
      expect {
        @hell_triangle = HellTriangle.new
      }.to raise_error(ArgumentError)
    end

    it "Initialize with passing an element as input but nil or empty" do
      expect {
        @hell_triangle = HellTriangle.new(nil)
      }.to raise_error(ValidationMessages::INITIALIZE_WITH_NULL_INPUT)
    end

    it "Initialize with passing an element as input but not array" do
      expect {
        @hell_triangle = HellTriangle.new("PARAM")
      }.to raise_error(ValidationMessages::INITIALIZE_WITH_NOT_ARRAY)
    end

    it "Initialize with array elements other than array" do
      expect {
        @hell_triangle = HellTriangle.new([1,2,3])
      }.to raise_error(ValidationMessages::INITIALIZE_WITH_NOT_ARRAY_ELEMENTS)
    end

    it "Initialize with values ​​elements not integer" do
      expect {
        @hell_triangle = HellTriangle.new([['a'], [2], [3]])
      }.to raise_error(ValidationMessages::INITIALIZE_WITH_NOT_INTEGER_ELEMENTS)
    end

    it "Initialize with elements with unsorted sizes" do
      expect {
        @hell_triangle = HellTriangle.new([[1], [2,3,4], [5, 6]])
      }.to raise_error(ValidationMessages::INITIALIZE_WITH_SIZE_ORDER_ELEMENTS)
    end
  end

  describe "hell triangle Algorithm" do
    it "Check if Hell triangle maximum total method exist" do
      @hell_triangle = HellTriangle.new([[1], [2, 3], [4, 5, 6]])
      expect(@hell_triangle).to respond_to(:maximum_total)
    end

    it "Return correct triangle maximum total" do
      @hell_triangle = HellTriangle.new([[6],[3,5],[9,7,1],[4,6,8,4]])
      expect(@hell_triangle.maximum_total).to equal(26)
    end
  end
end
