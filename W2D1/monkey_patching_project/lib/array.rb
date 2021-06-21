# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum / (self.length / 1.0)
  end

  def median
    return nil if self.empty?
    if self.length % 2 == 0
        return ((self.sort)[(self.length/2)] + (self.sort)[(self.length/2) - 1])/2.0
    else
        return (self.sort)[self.length / 2]
    end
  end

  def counts
    count = Hash.new(0)
    self.each {|ele| count[ele] += 1}
    count
  end


  
end
