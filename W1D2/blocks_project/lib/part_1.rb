


def select_even_nums(array)
    array.select{|ele| ele.even?}
end


def reject_puppies(array)
    array.reject {|ele| ele["age"] <= 2}
end


def count_positive_subarrays(array_multi)
    array_multi.count {|array| array.sum > 0}
end

def aba_translate(word)
    new_word = ""
    word.each_char do |char|
        "aeiou".include?(char) ? new_word += char + 'b' + char : new_word += char
    end
    new_word
end



def aba_array(array)
    array.map {|word| aba_translate(word)}
end
