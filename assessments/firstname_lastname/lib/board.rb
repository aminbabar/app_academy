require "byebug"
class Board
    attr_reader(:max_height)

    def self.build_stacks(num_stacks)
        return Array.new(num_stacks) {[]}
    end

    def initialize(num_stacks, max_height)
        raise "rows and cols must be >= 4" if max_height < 4 || num_stacks < 4


        @max_height = max_height
        @stacks = Board.build_stacks(num_stacks)

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
        @stacks.each do |stack| 
            return true if stack.all?{|ele| ele == token} && stack.length >= @max_height
        end
        false
    end

    def horizontal_winner?(token)
        debugger
        # @stacks.first.zip(*@stacks.drop(1)).any? { |col| col.all? { |el| el == token }}
        min_stack_height = (@stacks.map {|arr| arr.length}).min
        (0...min_stack_height).each do |i|
            win = true
            (0...@stacks.length).each do |j|
                win = false if @stacks[j][i] != token
            end
            return true if win
        end
        false
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end



small_board = Board.new(7, 6)
big_board = Board.new(8, 10)

stacks_1 = [
    ['b', 'b'],
    ['y', 'b', 'y', 'y', 'y', 'y' ],
    ['y', 'b','y'],
    ['b', 'b'],
    ['b', 'b', 'b'],
    ['b', 'b'],
    ['b', 'b'],
]

small_board.instance_variable_set(:@stacks, stacks_1)
p small_board.horizontal_winner?('b')



# stacks_2 = [
#     ['y'],
#     ['y'],
#     ['y'],
#     ['y'],
#     ['y'],
#     ['y'],
#     ['y'],
#     ['y']
# ]
# big_board.instance_variable_set(:@stacks, stacks_2)
# p big_board.horizontal_winner?('y')






