# basic class to initialize and hold the logic of life 
# will be a simple n*n array 
class Board 
    attr_reader :game_board

    def initialize n
        unless n.is_a?(Numeric) && n > 2 
            @game_board = nil
            return nil
        end 

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

    # simple implementation of printing out a 2x2 array 
    def print_board 
        system "clear"       
        
        print_bounds
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
        print_bounds
    end 
    
    # main logic for Game of Life 
    # will follow the following rules 
    #   1. Any live cell with two or three live neighbors survives.
    #   2. Any dead cell with three live neighbors becomes a live cell.
    #   3. All other live cells die in the next generation. Similarly, all other dead cells stay dead.
    # and print the resulting board 
    def advance
        old = snapshot
        self.print_board
    end 

    #:private
    # create a deep copy of the current board to act as a reference snapshot to calculate 
    # the next tick
    def snapshot 
        snap = []
        @game_board.each{ |row|
            row_copy = [] 
            row.each{|val| row_copy << val}
            snap << row_copy
        }
        snap
    end 

    # Check to see if the cell at given position will become live or die 
    # will check its 8 neighbors (less for boundary cells)
    def check_liveliness(i,j)
        left_bound = i-1 unless i == 0
        right_bound = i+1 unless i == @board_size - 1
        upper_bound = j-1 unless j == 0
        lower_bound = j+1 unless j == @board_size - 1

        neighbors = [] 
        (left_bound..right_bound).each{ |row|
            (upper_bound..lower_bound).each{ |col| 
                neighbors << @game_board[row][col] unless row == i && col == j
            }
        }
        live_neighbors = neighbors.count{ |x| x == 1 }
        if @game_board[i][j] == 0 
            live_neighbors == 3 
        else 
            live_neighbors == 2 || live_neighbors == 3 
        end 
    end 

    def print_bounds 
        (5*@board_size).times{
            print "-"
        }
        puts
    end 
end 