require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code_instance)
        print "exact matches: #{code_instance.num_exact_matches(@secret_code)}"
        print "near matches: #{code_instance.num_near_matches(@secret_code)}"
    end

    def ask_user_for_guess
        puts "Enter a code"
        user_input_code = Code.from_string(gets.chomp)
        print_matches(user_input_code)
        user_input_code.num_exact_matches(@secret_code) == user_input_code.length
    end

end
