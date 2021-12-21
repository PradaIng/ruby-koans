# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#

def triangle(a, b, c)
  sides = [a, b, c]
  unique_sides = sides.uniq 
  validate_edges!(sides)
  # WRITE THIS CODE
  case unique_sides.length
  when 1
    :equilateral
  when 2
    validate_isosceles_edges!(sides)
    :isosceles
  else
    :scalene
  end
end

def validate_edges!(sides)
  any_invalid = sides.any? do |side|
    side <= 0
  end

  raise TriangleError if any_invalid
  true
end

def validate_isosceles_edges!(sides)
  sides_max = sides.max
  sides_max_count = sides.count(sides_max)

  raise TriangleError if sides_max_count == 1
  true
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
