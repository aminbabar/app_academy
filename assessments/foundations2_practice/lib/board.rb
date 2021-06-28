require "byebug"

class Board

    attr_reader(:max_height)

    def self.build_stacks(num_of_stacks)
        return Array.new(num_of_stacks) {[]}
    end

    def initialize(num_of_stacks, max_height)
        raise "rows and cols must be >= 4" if num_of_stacks < 4 || max_height < 4
        @max_height = max_height
        @stacks = Board.build_stacks(num_of_stacks)
    end

    def add(token, stack_index)
        if @stacks[stack_index].length < @max_height
            @stacks[stack_index] << token
            return true
        else
            return false
        end
    end

    def vertical_winner?(token)
        (@stacks.any? { |arr| arr.all?{|ele| ele == token} && arr.length == @max_height})

    end

    def horizontal_winner?(token)
        (@stacks[0].zip(*@stacks[1..-1])).any?{|col| col.all?{|ele| ele == token}}
        # minimum = @stacks.map{|arr| arr.length}.min
        # (0...minimum).each do |i|
        #     win = true
        #     (0...@stacks.length).each do |j|
        #         win = false if @stacks[j][i] != token
        #     end
        #     return true if win
        # end

        # return false
    end


    def winner?(token)
        self.horizontal_winner?(token) || self.vertical_winner?(token)
    end










    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end


