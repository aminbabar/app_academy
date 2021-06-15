


def reverser(string, &prc)
    prc.call(string.reverse)
end


def word_changer(string, &prc)
    new_arr = []
    string = string.split(" ")
    string.each {|word| new_arr << prc.call(word) }
    new_arr.join(" ") 
end


def greater_proc_value(number, prc1, prc2)
    prc1.call(number) > prc2.call(number) ? prc1.call(number) : prc2.call(number)
end


def and_selector(array, prc1, prc2)
    new_arr = []
    array.each {|ele| new_arr << ele if prc1.call(ele) && prc2.call(ele)}
    new_arr
end


def alternating_mapper(array, prc1, prc2)
    new_arr = []
    array.each_with_index do |ele, i|
        if i % 2 == 0
            new_arr << prc1.call(ele)
        else
            new_arr << prc2.call(ele)
        end
    end
    new_arr
end
