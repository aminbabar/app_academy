
require "byebug"

def palindrome?(string)
    front = 0
    back = string.length - 1

    while front < back
        if string[front] != string[back]
            return false
        else
            front += 1
            back -= 1
        end
    end
    true
end


def substrings(str)
    subs = []
    i, j = 0, 0

    while i < str.length
        j = i
        while j < str.length
            subs << str[i..j]
            j += 1
        end
        i += 1
    end
    subs
end


def palindrome_substrings(str)
    substrings(str).select {|sub| sub.length > 1 && palindrome?(sub)}
end

