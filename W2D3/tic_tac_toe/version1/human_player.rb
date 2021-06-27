


class HumanPlayer
    attr_reader(:mark)

    def initialize(mark)
        @mark = mark
    end

    def get_position()
        p "Enter a move #{@mark}: "
        input = gets.chomp.split(" ")
        raise "Invalid" if input.length != 2
        input.map{|ele| ele.to_i}
    end
end
