require 'kite_string'
require 'point'
require 'test/unit'
class TestKiteString < Test::Unit::TestCase
  def test_intersection_of_strings_gets_correct_point
    a1 = Point.new(0,0)
    a2 = Point.new(1,1)
    a3 = Point.new(2,2)
    b1 = Point.new(0,2)
    b2 = Point.new(1,1)
    b3 = Point.new(2,0)
    string_a = KiteString.new([a1,a2,a3])
    string_b = KiteString.new([b1,b2,b3])
    assert_equal(Point.new(1,1),string_a.intersection_of(string_b))
    assert_equal(Point.new(1,1),string_b.intersection_of(string_a))
  end
end
