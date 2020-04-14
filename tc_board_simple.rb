require 'test/unit'
require "test/unit/assertions"
include Test::Unit::Assertions
require_relative 'board'

class Board_Tests < Test::Unit::TestCase
    def board_test0
        puts "starting board_test0"
        assert_nil( board.new 'a')
        puts "passed board_test0"
    end 

    def board_test1
        board1 = Board.new(2).game_board #a 2x2 board 
        board1.each{ |row| 
            row.each{ |val|
                assert (val == 0 || val == 1)
            }
        }
        assert false
        puts "Passed board_test1"
    end 
end 