require './board'

board_size = ARGV.first.to_i
board_size = 10 if board_size.nil?
game = Board.new(board_size)

puts "Staring the game of life"
game.print_board
loop do
    game.step
    sleep(0.5)
end