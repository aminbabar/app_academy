class Board
    attr_reader(:size)

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

    
end
