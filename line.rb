require 'enumerator'
class Line
  attr_reader :start_pt, :end_pt
  protected :start_pt, :end_pt
  def initialize(start_pt,end_pt)
    @start_pt, @end_pt = start_pt, end_pt
  end
  
  def intersection_with(other)
    x = (other.slope * other.start_pt.x - slope * start_pt.x + start_pt.y - other.start_pt.y) / (other.slope - slope)
    y = slope*(x - start_pt.x) + start_pt.y
    if (contains?(Point.new(x,y)))
      return Point.new(x,y)
    else
      return nil
    end
  end

  def slope()
    (@start_pt.y - @end_pt.y).to_f / (@start_pt.x - @end_pt.x).to_f
  end

  def contains?(point)
    return (point.y == ((slope * (point.x - @start_pt.x)) + @start_pt.y))  
  end
end
