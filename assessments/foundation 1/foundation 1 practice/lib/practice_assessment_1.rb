# Define your methods here. 



def first_letter_vowel_count(sentence)
    words = sentence.split(" ")
    words.count {|word| "aeiou".include?(word[0].downcase)}
end


def count_true(array, prc)
    array.count {|ele| prc.call(ele)}
end


def procformation(arr, prc1, prc2, prc3)
    res = []
    arr.each do |ele|
        if prc1.call(ele)
            res << prc2.call(ele)
        else
            res << prc3.call(ele)
        end
    end
    res
end


def array_of_array_sum(multi_array)
    total = 0
    multi_array.each {|arr| total += arr.sum}
    total
end


def selective_reverse(sentence)
    words = sentence.split(" ")
    words.map! {|word| "aeiou".include?(word[0]) || "aeiou".include?(word[-1]) ? word : word.reverse}
    words.join(" ")
end


def hash_missing_keys(hash, *args)
    return [] if args.empty?
    args.select {|ele| hash[ele] == nil}
end