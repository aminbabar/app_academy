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


end
