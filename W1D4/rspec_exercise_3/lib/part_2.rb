

def element_count(array)
    hash = Hash.new(0)
    array.each {|ele| hash[ele] += 1}
    hash
end


def char_replace!(string, hash)
    new_str = ""
    string.each_char.with_index {|char, i| string[i] = (hash[char]) ? hash[char] : char}
    string
end


def product_inject(array)
    array.inject(:*)
end
