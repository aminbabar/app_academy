
require "byebug"


# do 
def duos(string)
    count = 0
    (0...string.length - 1).each do |i|
        count += 1 if string[i] == string[i + 1]
    end
    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0


#do 
def sentence_swap(sentence, hash)
    new_sent = []
    sentence = sentence.split(" ")
    sentence.each {|word|  (hash[word]) ? new_sent << hash[word] : new_sent << word }
    new_sent.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'




def hash_mapped(hash, prc, &block)
    new_hash = {}
    hash.each {|key, val| new_hash[block.call(key)] = prc.call(val)}
    new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}



# why is hash used in the solutions? Hash does not maintain order?!!!!!!!!!!!
def counted_characters(string)
    count = Hash.new(0)
    chars = []
    string.each_char {|char| count[char] += 1}
    string.each_char {|char| chars << char if count[char] > 2}
    chars.uniq
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []



def triplet_true(string)
    prev = ""
    count = 1
    string.each_char do |char|
        if char == prev
            count += 1
        else
            count = 1
        end
        prev = char
        return true if count >= 3
    end
    false
end


# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false


def energetic_encoding(string, hash)
    new_str = ""
    string.each_char do |char|
        if char == " "
            new_str += " " 
            next
        end
        new_str += hash[char] ? hash[char] : "?"
    end
    new_str
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'



def uncompress(string)
    i = 1
    new_str = ""
    while i < string.length
        new_str += string[i - 1] * string[i].to_i 
        i += 2
    end
    new_str
end



# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'