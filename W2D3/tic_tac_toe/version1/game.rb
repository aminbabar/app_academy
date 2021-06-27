require "./board.rb"
require "./human_player.rb"


class Game
    def initialize(player1_mark, player2_mark)
        @player1 = HumanPlayer.new(player1_mark)
        @player2 = HumanPlayer.new(player2_mark)
        @board = Board.new()
        @current_player = @player1
    end

    def switch_turn
        @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
    end

    def play
        while @board.empty_positions?
            @board.print()
            pos = @current_player.get_position()
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print()
                puts "#{@current_player.mark} won!"
                return
            end
            self.switch_turn()
        end
        puts "The game ended in a draw"
    end

end


game = Game.new(:X, :Y)
game.play()
