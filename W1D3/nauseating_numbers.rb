

require "byebug"


def strange_sums(arr)
    sum = 0
    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            sum += 1 if arr[i] + arr[j] == 0
        end
    end
    sum
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0



def pair_product(arr, product)
    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            return true if j > i && arr[i] * arr[j] == product 
        end
    end
    false
end
# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false



def rampant_repeats(string, hash)
    new_str = ""
    string.each_char do |char|
        new_str += (hash[char]) ? char * hash[char] : char
    end
    new_str
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'


def perfect_square(num)
    return (Math.sqrt(num) > Math.sqrt(num).to_i) ? false : true
end


# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false






######################################################################
# PHASE 2
######################################################################





def anti_prime?(number)
    max = 0
    (1...number).each do |i|
        factors = num_factors(i)
        max = factors if factors > max
    end
    # debugger
    (max > num_factors(number)) ? false : true
end


def num_factors(num)
    sum = 0
    (1..num).each {|i| sum += 1 if num % i == 0}
    sum
end
# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false





def matrix_addition(matrix1, matrix2)
    resultant = Array.new(matrix1.length) {[]}

    (0...matrix1.length).each do |i|
        (0...(matrix1[0].length)).each do |j|
            resultant[i] << matrix1[i][j] + matrix2[i][j]
        end
    end
    resultant
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]






def mutual_factors(*args)
    common = []
    all_factors = Hash.new(0)
    args.each {|nums| calculate_factors(nums, all_factors)}
    all_factors.each {|key, value| common << key if value == args.length}
    common
end

def calculate_factors(num, all_factors)
    (1..num).each do |i|
        all_factors[i] += 1 if num % i == 0
    end
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]



def tribonacci_number(n)
    if n == 1
        return 1
    elsif n == 2
        return 1
    elsif n == 3
        return 2
    end

    return tribonacci_number(n-1) + tribonacci_number(n-2) + tribonacci_number(n-3)
end


# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274





######################################################################
# PHASE 3
######################################################################




def matrix_addition_reloaded(*args)
    # width = args[0][0]
    # height = args[0][0][0]

    # args.each {|matrix| return false if matrix.}

end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil



# Better time efficiency than the solution
def squarocol?(multi_array)

    col_bool = true
    row_bool = true
    (0...multi_array.length).each do |row|
        first_col = multi_array[0][row]
        first_row = multi_array[row][0]
        (0...multi_array.length).each do |col|
            col_bool = false if multi_array[col][row] != first_col
            row_bool = false if multi_array[row][col] != first_row
        end
        return true if col_bool || row_bool
        row_bool, col_bool = true, true 
    end

    return false
end


# p squarocol?([
#     [:a, :x , :d],    
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false



def squaragonal?(multi_array)     #0,0  1,1  2,2      0,2  1,1  2,0

    first = multi_array[0][0]
    rTol = true
    (0...multi_array.length).each do |i|
        rTol = false if multi_array[i][i] != first
    end

    i = 0
    j = multi_array.length - 1

    first =  multi_array[i][j]
    lTor = true
    while j >= 0
        lTor = false if multi_array[i][j] != first
        i += 1
        j -= 1
    end


    lTor || rTol
end


# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false



def pascals_triangle(n)
    pascal = [[1]]
    while pascal.length < n
        new_row = [1]
        (0...pascal[-1].length - 1).each do |i|
            new_row << pascal[-1][i] + pascal[-1][i + 1]
        end
        new_row << 1
        pascal << new_row
    end
    pascal
end



# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(1000)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]



######################################################################
# PHASE 4
######################################################################



def mersenne_prime(num)
    found = 0
    square = 4
    while true
        if is_prime?(square - 1)
            found += 1
        end
        return (square - 1) if num == found
        square *= 2
    end
end


def is_prime?(num)
    return false if num < 2
    (2...num).none? {|i| num % i == 0}
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071






# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false




# # p consecutive_collapse([3, 4, 1])                     # [1]
# # p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# # p consecutive_collapse([9, 8, 2])                     # [2]
# # p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# # p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# # p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# # p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# # p consecutive_collapse([13, 11, 12, 12])              # []



# # p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# # p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# # p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# # p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# # p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# # p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# # p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# # p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# # p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# # p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]
