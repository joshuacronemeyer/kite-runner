require 'test/unit'
require 'point'
class TestPoint < Test::Unit::TestCase
  def test_equals
    x = Point.new(1,1)
    y = Point.new(1,1)
    assert_equal(x,y)
    y = Point.new(1,2)
    assert_not_equal(x,y)
    y = nil
    assert_not_equal(x,y)
    assert_not_equal(x,7)
  end
end
