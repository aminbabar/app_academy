

class Board
    
    def initialize()
        @grid = Array.new(3) {Array.new(3, '_')}
    end

    def valid?(position)
        x, y = position
        return false if x > 3 || y > 3 || x < 0 || y < 0
        true
    end

    def empty?(position)
        x, y = position
        @grid[x][y] == "_"
    end

    def place_mark(pos, mark)
        x, y = pos
        if self.valid?(pos) && self.empty?(pos)
            @grid[x][y] = mark
        else
            raise "Invalid"
        end
    end

    def print()
        @grid.each do |arr|
             p (arr)
             puts ""
        end
        true
    end

    def win_row?(mark)
        @grid.each do |arr|
            return true if arr.all? {|ele| ele == mark}
        end
        false
    end


    def win_col?(mark)
        (0...@grid.length).each.each do |i|
            win = true
            (0...@grid[0].length).each do |j|
                win = false if @grid[j][i] != mark
            end
            return win if win
        end
        false
    end


    def win_diagonal?(mark)
        self.find_in_direction([1, -1], mark, [0, 0]) || self.find_in_direction([-1, -1], mark, [@grid[0].length - 1, @grid.length - 1])
    end

    def find_in_direction(dir, mark, start)
        dx, dy = dir
        x, y = start

        while x >= 0 && y >= 0 && x < @grid[0].length && y < @grid.length
            return false if @grid[x][y] != mark
            x += dx
            y += dy
        end
        true
    end



    def win?(mark)
        self.win_col(mark) || self.win_diagonal(mark) || self.win_row(mark)
    end

    def empty_positions?()
        @grid.flaten.any? {|ele| ele == "_"}
    end


end