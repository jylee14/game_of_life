require 'test/unit'
require "test/unit/assertions"
include Test::Unit::Assertions
require_relative 'board'

class Board_Tests < Test::Unit::TestCase
    def test_failing_board_init
        assert_nil Board.new('a').game_board
        assert_nil Board.new(2).game_board
    end 

    def test_snapshot
        (3..10).each{ |n| 
            board = Board.new(n)
    
            old = board.snapshot
            assert_equal board.game_board, old
        }
    end 

    def test_liveliness 
        board = Board.new([
            [1, 0, 0],
            [0, 0, 1],
            [1, 0, 0]
        ])

        truth = [
            [false, false, false], 
            [false, true, false], 
            [false, false, false]
        ]
        (0..2).each{ |i| 
            (0..2).each{ |j| 
                assert_equal truth[i][j], board.check_liveliness(board.game_board, i,j)
            }
        }
    end 

    def test_advance 
        board = Board.new([
            [1, 0, 0],
            [0, 0, 1],
            [1, 0, 0]
        ])

        adv = [
            [0, 0, 0], 
            [0, 1, 0], 
            [0, 0, 0]
        ]

        assert_equal board.advance, adv
    end 
end 