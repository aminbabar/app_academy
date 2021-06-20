
require "byebug"

#################################################################################
#                                   PHASE 1
#################################################################################
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


#################################################################################
#                                   PHASE 2
#################################################################################


def conjunct_select(array, *procs)
    array.select do |ele|
        procs.all? {|proc| proc.call(ele)}
    end
end


# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]





def convert_pig_latin(sentence)
    new_sent = []
    sentence = sentence.split(" ")

    sentence.each do |word|
        if word.length < 3
            new_sent << word
        elsif "aeiou".include?(word[0])
            new_sent << word + "yay"
        else
            word_added = false
            word.each_char.with_index do |letter, i|
                if "aeiou".include?(letter.downcase)
                    new_sent << word[i...word.length] + word[0...i] + "ay"
                    word_added = true
                    break
                end
            end
            new_sent << word if !word_added
            new_sent[-1] = new_sent[-1].capitalize if word[0] == word[0].upcase
        end
    end
    new_sent.join(" ")
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"





def reverberate(sentence)
    sentence = sentence.split(" ")
    sentence.map! do |word|
        if word[0] == word[0].upcase
            translate(word).capitalize
        else
            translate(word)
        end
    end
    sentence.join(" ")
end

def translate(word)
    return word if word.length < 3
    if "aeiou".include?(word[-1])
        return (word * 2)
    else
        last_vowel_index = nil
        word.each_char.with_index {|char, i| last_vowel_index = i if "aeiou".include?(char.downcase) }
        return word + word[last_vowel_index..-1]
    end
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"








def disjunct_select(arr, *procs)
    arr.select {|ele| procs.any?{|prc| prc.call(ele)}}
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]





def alternating_vowel(sent)
    sent = sent.split(" ")
    sent.map!.with_index do |word, i|
        i % 2 == 0 ? replace_even(word) : replace_odd(word)
    end
    sent.join(" ")
end

def replace_odd(word)
    replace_even(word.reverse).reverse
end


def replace_even(word)
    new_word = ""
    word.each_char.with_index do |char, i|
        if "aeiou".include?(char.downcase)
            return new_word if i + 1 >= word.length
            new_word += word[i + 1..-1]
            return new_word
        end
        new_word += char
    end
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"



def silly_talk(sent)
    sent = sent.split(" ")
    sent.map! {|word| (word[0] == word[0].upcase) ? help_silly_talk(word).capitalize : help_silly_talk(word)}
    sent.join(" ")
end

def help_silly_talk(word)
    return (word + word[-1]) if "aeiou".include?(word[-1].downcase)
    new_word = ""
    word.each_char {|char| new_word += "aeiou".include?(char.downcase) ? char + 'b' + char : char }
    new_word
end


# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"




def compress (string)
    count = 1
    i = 0
    new_str = ""
    while i < string.length
        if (i + 1) < string.length && string[i + 1] == string[i]
            count += 1
            i += 1
            next
        end
        
        if count > 1
            new_str += string[i] + count.to_s
        else
            new_str += string[i]
        end
        count = 1
        
        i += 1
    end
    return new_str
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"