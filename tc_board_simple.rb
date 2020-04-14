require 'test/unit'
require "test/unit/assertions"
include Test::Unit::Assertions
require_relative 'board'

class Board_Tests < Test::Unit::TestCase
    def test_failing_board_init
        assert_nil Board.new('a').game_board
        assert_nil Board.new(2).game_board
    end 

    def test_board_init_with_0_or_1
        board1 = Board.new(3).game_board #a 3x3 board 
        board1.each{ |row| 
            row.each{ |val|
                assert (val == 0 || val == 1)
            }
        }
    end 

    def test_snapshot
        (3..10).each{ |n| 
            board = Board.new(n)
    
            old = board.snapshot
            assert_equal board.game_board, old
        }
    end 
end 