
require "byebug"

# [1, 2, 3], 
# [4, 5], 
# [1, 2, 3] 
# [2, 2,]


# [[1,4,], [2,5,], [3,6,]]

# 1

def zip(*args)
    
    multi = Array.new(args[0].length) {[]}

    (0...args.length).each do |i|
        (0...args[0].length).each do |j|
            multi[j] << args[i][j]
        end
    end
    multi
end


def prizz_proc(arr, prc1, prc2)
    arr.select {|ele| (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))}
end

# [1, 2, 3], 
# [4, 5], 
# [1, 2, 3] 
# [2, 2,]


# LOOK AT SOLUTION FOR THIS AND UNDERSTAND IT WITH THE MAP 
def zany_zip(*args)
    length = args.map(&:length).max
    multi = Array.new(length) {[]}

    (0...args.length).each do |i|
        (0...length).each do |j|
            if j >= args[i].length
                multi[j] << nil
            else
                multi[j] << args[i][j]
            end
        end
    end
    multi
end

# # COPIED FROM SOLUTIONS
# def zany_zip(*arrays)
#     length = arrays.map(&:length).max

#     (0...length).map do |i|
#         arrays.map { |array| array[i] }
#     end
# end


def maximum(arr, &prc)
    return nil if arr.empty?
    max = arr[0]
    arr.each {|ele| max = ele if prc.call(ele) >= prc.call(max) }
    max
end

def my_group_by(arr, &prc)
    hash = Hash.new {|h, k| h[k] = []}
    arr.each do |ele|
        hash[prc.call(ele)] << ele
    end
    hash
end


def max_tie_breaker(array, prc, &block)
    return nil if array.empty?

    max = array.first
    array.each do |ele|
        if block.call(ele) > block.call(max)
            max = ele
        elsif block.call(ele) == block.call(max)
            max = ele if prc.call(ele) > block.call(ele)
        end
    end
    max
end

def silly_syllables(sentence)
    sentence = sentence.split(" ")
    num_vowels = 0
    sentence.map! do |word|
        first_vowel, last_vowel = nil, nil
        word.each_char.with_index do |char, i|
            if "aeiou".include?(char)
                first_vowel ||= i 
                last_vowel = i
                num_vowels += 1
            end
        end
        if num_vowels >= 2
            num_vowels = 0
            word[first_vowel..last_vowel]
        else
            num_vowels = 0
            word
        end
    end
    sentence.join(" ")
end