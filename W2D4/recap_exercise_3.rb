require "byebug"


def no_dupes?(arr)
    count = Hash.new(0)
    arr.each {|ele| count[ele] += 1}
    new_arr = []
    arr.each {|ele| new_arr << ele if count[ele] == 1}
    new_arr
end


# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)
    (0...arr.length-1).each do |i|
        return false if arr[i] == arr[i + 1]
    end
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true


def char_indices(str)
    hash = Hash.new {|h, k| h[k] = []}
    str.each_char.with_index {|char, i| hash[char] << i}
    hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
    char = str[0]
    longest = 1
    count = 1

    i = 0
    while i < str.length
        if str[i] == str[i + 1]
            count += 1
            i += 1
            next
        else
            if count >= longest
                char = str[i]
                longest = count
            end
            count = 1
        end

        i += 1

    end

    char * longest

end


# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'



def bi_prime?(num)
    primes = []
    (2...num).each {|num| primes << num if is_prime?(num)}

    (0...primes.length).each do |i|
        (i...primes.length).each do |j|
            return true if (primes[i] * primes[j]) == num
        end
    end
    false
end


def is_prime?(num)
    return false if num < 2
    (2...num).each {|i| return false if num % i == 0}
    true
end


# Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

[1,2,3]


def vigenere_cipher(message, keys)
    alpha = ('a'..'z').to_a
    vig = ""
    message.each_char.with_index do |char, i|
        shift = keys.length != 1 ? keys[i % (keys.length)] : keys[0]
        vig += alpha[(alpha.index(char) + shift) % 26]
    end
    vig
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vowel_rotate(str)
    vowels = []
    str.each_char {|ele| vowels << ele if "aeiou".include?(ele)}
    vowels.unshift(vowels.pop)
    new_str = ""

    i = 0
    str.each_char do |char|
        if "aeiou".include?(char)
            new_str += vowels[i]
            i += 1
        else
            new_str += char
        end
    end
    new_str
end

# # Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"



class String
    def select(&prc)
        return "" if !prc
        new_str = ""
        self.each_char {|char| new_str += char if prc.call(char)}
        new_str
    end

    def map!(&prc)
        self.each_char.with_index {|ele, i| self[i] = prc.call(ele, i)}
    end
end


# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""



# # Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"


def multiply(a, b)
    return a if b == 1
    return 0 if b == 0 || a == 0

    if (b < 0 && a > 0) || (b < 0 && a < 0)
        a = a * -1
        b = b * -1
    end

    a + multiply(a, b - 1)
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18



def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2, 1] if num == 2

    arr = lucas_sequence(num - 1)

    arr[-1] + arr[-2]

end

    



# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

# def is_prime?(num)
#     return false if num < 2
#     (2...num).each {|i| return false if num % i == 0}
#     true
# end

def prime_factorization(num)
    return [] if num == 1

    (2..num).each do |i|
        if num % i == 0
            return [i] + prime_factorization(num / i)
        end
    end
end


p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]