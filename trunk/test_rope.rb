require 'test/unit'
require 'rope'
class TestRope < Test::Unit::TestCase
  def test_initialized_rope_has_correct_number_of_segments
    assert_equal(1.0,Rope::SEGMENT_LENGTH)
    rope = Rope.new(Object.new,100,0,0)
    assert_equal(101,rope.joints.size)
  end

  def test_joints_have_proper_coordinates_after_initialization
    rope = Rope.new(Object.new,100,0,0)
    assert_equal(0,rope.joints.first.x)
    assert_equal(0,rope.joints.last.x)
    assert_equal(0,rope.joints.first.y)
    assert_equal(-100,rope.joints.last.y)
  end

  def test_move_left
    rope = Rope.new(Object.new,100,0,0)
    rope.move(270)
    assert(rope.joints.last.x < 0)
  end
end
