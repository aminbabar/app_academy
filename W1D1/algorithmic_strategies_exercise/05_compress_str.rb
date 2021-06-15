# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
require "byebug"
def compress_str(str)
    string = str.split("")
    word = ""
    counter = 1
    (1..string.length - 1).each do |idx|
        prev = string[idx - 1]
        if string[idx] == string[idx - 1]
            counter += 1
            word += counter.to_s + prev if string.length - 1 == idx
            prev = string[idx - 1]
            next
        elsif counter > 1 
            word += counter.to_s + prev
        else
            word += prev
        end

        word += string[idx] if string.length - 1 == idx
        counter = 1
    end
    word
end


p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
