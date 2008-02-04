require 'line'
require 'point'
require 'test/unit'
class TestLine < Test::Unit::TestCase
  def test_point_on_line_is_contained_in_the_line
    line_a = Line.new(Point.new(0,0),Point.new(1,1))
    assert(line_a.contains?(Point.new(0,0)))
    assert(line_a.contains?(Point.new(1,1)))
    assert(line_a.contains?(Point.new(0.5,0.5)))
  end
  def test_point_on_line_is_contained_even_if_decimal_places_are_used
    line_a = Line.new(Point.new(0,2),Point.new(1,1))
    assert(line_a.contains?(Point.new(1.0,1.0)))
    line_b = Line.new(Point.new(0,0),Point.new(0.25,0.75))
    assert(line_b.contains?(Point.new(0.25,0.75)))
  end
  def test_point_contained_on_line_with_negative_slope
    line_a = Line.new(Point.new(0,2),Point.new(1,1))
    assert(line_a.contains?(Point.new(0,2)))
    assert(line_a.contains?(Point.new(1,1)))
  end
  def test_slope
    line_a = Line.new(Point.new(0,0),Point.new(1,1))
    assert_equal(1.0,line_a.slope)
    line_b = Line.new(Point.new(0,1),Point.new(1,0))
    assert_equal(-1.0,line_b.slope)
  end
  def test_intersection_of_unit_graph_is_correct_and_interchangeable
    string_a = Line.new(Point.new(0,0),Point.new(1,1))
    string_b = Line.new(Point.new(1,0),Point.new(0,1))
    assert_equal(Point.new(0.5,0.5),string_b.intersection_with(string_a))
    assert_equal(Point.new(0.5,0.5),string_a.intersection_with(string_b))
  end
  def test_intersection_with_self_returns_nil
    string_b = Line.new(Point.new(1,0),Point.new(0,1))
    assert_nil(string_b.intersection_with(string_b))
  end
  def test_intersection_with_origin
    string_a = Line.new(Point.new(0,0),Point.new(1,1))
    string_b = Line.new(Point.new(0,2),Point.new(1,1))
    assert_equal(Point.new(1,1),string_b.intersection_with(string_a))
    assert_equal(Point.new(1,1),string_a.intersection_with(string_b))
  end
  def test_intersection_works_for_floating_point_numbers
    string_a = Line.new(Point.new(0,0),Point.new(0.25,0.75))
    string_b = Line.new(Point.new(1,0),Point.new(0,1))
    assert_equal(Point.new(0.25,0.75), string_a.intersection_with(string_b))
    assert_equal(Point.new(0.25,0.75), string_b.intersection_with(string_a))
  end
end


