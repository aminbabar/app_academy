
require "byebug"

def partition(array, num)
    arr1 = []
    arr2 = []
    array.each {|ele| ele >= num ? arr2 << ele : arr1 << ele}
    return [arr1, arr2]
end


def merge(hash1, hash2)
    new_hash = {}
    hash1.each {|value, key| new_hash[value] = key}
    hash2.each {|value, key| new_hash[value] = key}
    new_hash
end


def censor(sentence, curse_arr)
    words = sentence.split(" ")
    words.map! do |word|
        if curse_arr.include? (word.downcase)
            replace_vowels(word)
        else
            word
        end
    end
    words.join(" ")
end


def replace_vowels(word)
    new_word = ""
    word.each_char do |char|
        new_word += "aeiou".include?(char.downcase) ? "*" : char
    end
    new_word
end


def power_of_two?(number)

    while number > 1
        number = number / 2.0
    end

    number == 1.0 ? true : false
    
end

