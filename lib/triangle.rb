class Triangle
  # write code here
  
  attr_accessor :a,:b,:c
  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    a = @a
    b = @b
    c = @c

    sides = [a,b,c]

    no_zeroes = sides.all?{|side| side > 0}

    no_side_too_long = ((a+b)>c) && ((a+c) > b) && ((b+c) > a)
    
    valid  = no_zeroes && no_side_too_long

    if !valid
      raise TriangleError
    else
      if a == b && b == c
        type = :equilateral
      elsif a == b || a ==c || b == c
        type = :isosceles
      else
        type = :scalene
      end
    end

    type   

  end



  class TriangleError < StandardError
    def message
      puts "Triangles must have all sides have greater length than 0, and the sum of any two sides be longer than the length of the third side"
    end
  end

end

# require'pry';binding.pry