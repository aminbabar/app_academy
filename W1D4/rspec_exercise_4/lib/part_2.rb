

def proper_factors(num)
    factors = []
    (1...num).each {|i| factors << i if num % i == 0}
    factors
end


def aliquot_sum(num)
    proper_factors(num).sum
end


def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    arr = []
    i = 1
    while arr.length != n
        arr << i if perfect_number?(i)
        i += 1
    end
    arr
end
