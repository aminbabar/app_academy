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


  def my_count(val)
    count = 0
    self.each {|ele| count += 1 if ele == val}
    count
  end


  def my_index(val)
    self.each_with_index {|ele, i| return i if val == ele }
    nil
  end


  def my_uniq   #!!!!!!
    hash = Hash.new(0)
    self.each {|ele| hash[ele] += 1}
    hash.keys
  end


  def my_transpose
    new_arr = Array.new (self[0].length) {[]}
    (0...self.length).each do |i|
        (0...self.length).each do |j|
            new_arr[j] << self[i][j]
        end
    end
    new_arr
  end


end
