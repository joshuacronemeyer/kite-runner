require 'enumerator'
class KiteString
  attr_reader :lines
  protected :lines
  def initialize(points)
    @lines = []
    points.each_cons(2){|start_pt, end_pt| @lines << Line.new(start_pt, end_pt)}
  end
  
  def intersection_of(other_string)
    # i multiply by a "unit slope" so that if slope is positive x is negated.  this seems to be a hack and maybe i just have a sign flipped on my formula somewhere.
    @lines.each do |my_line|
      other_string.lines.each do |other_line|
        intersection = my_line.intersection_with(other_line)
        p intersection
        return intersection unless intersection.nil?
      end
    end
  end
  
end
