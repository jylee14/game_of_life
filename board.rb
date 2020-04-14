# basic class to initialize and hold the logic of life 
# will be a simple n*n array 
class Board 
    attr_reader :game_board

    def initialize n
        return nil unless n.is_a?(Numeric) && n > 3 
        coin = Random.new 
        @board_size = n
        @game_board = Array.new(n) {
            Array.new(n)
        }
        n.times{ |i| 
            n.times{ |j| 
                @game_board[i][j] = coin.rand(0..1)
            }
        }
        @game_board
    end 

    def print_board 
        system "clear"
        (5*@board_size).times{
            print "-"
        }
        print "\n"

        @board_size.times{ |i| 
            print "|   "
            @board_size.times{ |j| 
                print "#{@game_board[i][j]}   "
            }
            puts "|"
            unless i == @board_size - 1
                puts
                puts
            end
        }
        (5*@board_size).times{
            print "-"
        }
    end 
end 