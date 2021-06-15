
require "byebug"

def hipsterfy(word)
    word = word.split("")
    (0...word.length).reverse_each.each do |i|
        if "aeiou".include?(word[i])
            word.delete_at(i)
            break
        end
    end
    word.join("")
end


def vowel_counts(str)
    counter = Hash.new(0)
    str = str.split("")

    str.each do |char|
        if "aeiou".include?(char.downcase)
            counter[char.downcase] += 1
        end
    end
    counter
end



def caesar_cipher(message, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"

    message = message.split("")
    caesar = ""

    message.each do |char|
        if alphabet.include?(char)
            caesar += alphabet[(alphabet.index(char) + n) % 26] 
        else
            caesar += char
        end
    end
    caesar
end

p caesar_cipher("apple", 1)
