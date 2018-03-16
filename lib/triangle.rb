require 'pry'

class Triangle

  attr_accessor :side1, :side2, :side3
  attr_reader :kind

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if self.valid?
      if @side1 == @side2 && @side2 == @side3
        @kind = :equilateral
      elsif @side1 == @side2 || @side1 == @side3 || @side2 == @side3
        @kind = :isosceles
      else
        @kind = :scalene
      end
    else
      begin
        raise TriangleError
      # rescue TriangleError => error
      #   puts error.message
      end
    end
  end

  def valid?
    if @side1 <= 0 || @side2 <= 0 || @side3 <= 0
      false
    elsif @side1 + @side2 <= @side3 || @side1 + @side3 <= @side2 || @side3 + @side2 <= @side1
      false
    else
      true
    end
  end

end

class TriangleError < StandardError
  def message
   "warning: invalid triangle."
  end
end

# Pry.start
