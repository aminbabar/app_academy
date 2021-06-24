require "byebug"

class Board
    attr_reader(:size)

    def self.print_grid(grid_m)
        len = grid_m.length - 1
        grid_m.each do |arr|
            arr.each_with_index do |ele, i|
                print (ele)
                print (" ") if i < len
            end
            puts
        end
    end


    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(pos, value)
        x, y = pos
        @grid[x][y] = value
    end

    def num_ships
        count = 0
        @grid.each do |arr|
            arr.each {|ele| count += 1 if ele == :S}
        end
        count
    end


    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end


    def place_random_ships
        count = Hash.new(0)
        num = @size * 25 / 100
        while self.num_ships < num  do
            num1 = rand(0...@grid.length)
            num2 = rand(0...@grid.length)
            self[[num1, num2]] = :S
        end
    end


    def hidden_ships_grid
        new_grid = Array.new(@grid.length) {[]}
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                new_grid[i][j] = (@grid[i][j] == :S) ? :N : @grid[i][j]
            end
        end
        new_grid
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
