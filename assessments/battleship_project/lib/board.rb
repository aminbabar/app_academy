class Board
    attr_reader(:size)

    def self.print_grid(multi_array)
        multi_array.each {|arr| puts (arr.join(" "))}
    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](arr)
        @grid[arr[0]][arr[-1]]
    end

    def []=(pos, val)
        x, y = pos
        @grid[x][y] = val
    end

    def num_ships
        @grid.flatten.count(:S)
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
        while self.num_ships() < (@size * 25) / 100
            num1 = rand(0...@grid.length)
            num2 = rand(0...@grid.length)
            @grid[num1][num2] = :S
        end
    end

    def hidden_ships_grid()
        @grid.map do |arr|
            arr.map {|ele| (ele == :S) ? :N : ele}
        end

    end


    def cheat
        Board.print_grid(@grid)
    end

    def print()
        Board.print_grid(self.hidden_ships_grid())
    end











end
