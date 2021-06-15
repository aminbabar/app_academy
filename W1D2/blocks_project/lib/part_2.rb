


def all_words_capitalized?(array)
    array.all? { |word| word.capitalize == word}
end


def no_valid_url?(array)
    invalid = ['com', 'net', 'io', 'org']

    array.none? do |url|
        (invalid.include?(url.split(".")[-1]))
    end

end


def any_passing_students?(array)
    array.any? do |student|
        student[:grades].sum / student[:grades].length >= 75
    end
end
