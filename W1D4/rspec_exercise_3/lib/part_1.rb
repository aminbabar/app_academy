


def is_prime?(num)
    return false if num < 2
    (2...num).each {|i| return false if num % i == 0}
    true
end

def nth_prime(n)
    i = 1
    count = 0
    while count < n
        count += 1 if is_prime?(i)
        i += 1
    end
    i - 1
end


def prime_range(min, max)
    primes = []
    (min..max).each {|num| primes << num if is_prime?(num)}
    primes
end