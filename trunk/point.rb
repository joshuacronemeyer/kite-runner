class Point
  attr_reader :x,:y
  def initialize(x,y)
    @x = x
    @y = y
  end

  def ==(other)
    return true if self.equal?(other)
    return false if !other.instance_of?(self.class)
    return (@x == other.x && @y == other.y)
  end
end

