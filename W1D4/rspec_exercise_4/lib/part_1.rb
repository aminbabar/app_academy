



def my_reject(array, &prc)
    array.select {|ele| !prc.call(ele)}
end



def my_one?(array, &prc)
    count = 0
    array.each do |ele|
        count += 1 if prc.call(ele)
        return false if count > 1
    end
    count == 1
end

require "byebug"

def hash_select(hash, &prc)
    new_hash = {}
    hash.each {|key, val| (new_hash[key] = val) if prc.call(key, val)}
    new_hash
end



def xor_select(array, prc1, prc2)
    array.select {|ele| (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))}
end



def proc_count(value, arr)
    arr.count {|prc| prc.call(value)}
end
