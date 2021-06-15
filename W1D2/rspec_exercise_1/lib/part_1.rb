


def average(num1, num2)
    (num1 + num2) / 2.0
end


def average_array(array)
    array.sum / (array.length / 1.0)
end

def repeat(str, num)
    str * num 
end


def yell (str)
    str.upcase + "!"
end


def alternating_case(str)
    str = str.split(" ")
    even = true
    str.each do |word|
        if even
            word.upcase!
        else
            word.downcase!
        end
        even = !even
    end
    str.join(" ")
end



p alternating_case("hello there")