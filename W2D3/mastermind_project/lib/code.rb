require "byebug"
class Code
  attr_reader(:pegs)


  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  } 


  def self.valid_pegs?(array_chars)
    array_chars.each do |char|
      if !POSSIBLE_PEGS.include?(char.upcase)
        return false
      end
    end
    return true
  end

  def self.random(length)
    new_pegs = []
    length.times {new_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(new_pegs)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end


  def initialize(array_pegs)
    raise "ERROR" if !Code.valid_pegs?(array_pegs)
    @pegs = array_pegs.map(&:upcase)
  end


  def [](index)
    @pegs[index]
  end


  def length()
    @pegs.length
  end

  def num_exact_matches(code_instance)
    num = 0
    (0...code_instance.length).each {|i| num += 1 if code_instance[i] == @pegs[i] }
    num
  end

  def num_near_matches(code_instance)
    near_matches = 0
    count = Hash.new(0)
    code_instance.pegs.each {|peg| count[peg] += 1}
    @pegs.each_with_index do |peg, i|
      if count[peg] >= 1 && peg != code_instance.pegs[i]
        count[peg] -= 1
        near_matches += 1
      elsif @pegs[i] == peg
        count[peg] -= 1
      end
    end
    near_matches
  end

  def ==(code_instance)
    @pegs == code_instance.pegs
  end

end
