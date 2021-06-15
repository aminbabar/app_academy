# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(number)
    i = number

    while i != 0 do
        # debugger
        if number % i == 0 && is_prime?(i)
            # debugger
            return i
        end
        i -= 1
    end


end


def is_prime?(num)
    if num < 2
        return false
    end
    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    true
end





def unique_chars?(string)
    counter = Hash.new(0)
    string.each_char do |char|
        if counter[char] != 0
            return false
        end

        counter[char] += 1
    end
    return true
end


def dupe_indices(array)
    hash = Hash.new {|h, k| h[k] = []}
    array.each_with_index {|ele, i| hash[ele] << i}
    hash.each{|key, val| hash.delete(key) if val.length < 2}
    hash
end


def ana_array(arr1, arr2)
    count1 = Hash.new(0)
    count2 = Hash.new(0)

    arr1.each {|ele| count1[ele] += 1}
    arr2.each {|ele| count2[ele] += 1}

    count1 == count2

end


