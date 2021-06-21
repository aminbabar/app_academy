# Define your methods here.



def string_map!(string, &prc)
    string.each_char.with_index {|char, i| string[i] = prc.call(string[i])}
end


def three?(array, &prc)
    count = 0
    array.each {|ele| count += 1 if prc.call(ele)}
    count == 3
end


def nand_select(arr, prc1, prc2)
    arr.select {|ele| !(prc1.call(ele) && prc2.call(ele))}
end


def hash_of_array_sum(hash)
    sum_total = 0
    hash.each {|key, val| sum_total += val.sum}
    sum_total
end


def abbreviate(sent)
    sent = sent.split(" ")
    new_sent = []
    sent.map! do |word|
        if word.length > 4
            remove_vowels(word)
        else
            word
        end
    end
    sent.join(" ")
end


def remove_vowels(word)
    new_word = ""
    word.each_char do |char|
        new_word += char if !("aeiou".include?(char.downcase))
    end
    new_word
end


def hash_selector(hash, *args)
    return hash if args.length == 0
    new_hash = {}
    args.each {|ele| new_hash[ele] = hash[ele]}
    new_hash
end
