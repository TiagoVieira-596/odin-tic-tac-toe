require_relative 'tic_tac_toe'
class Game
  include CheckVictory
  @@board_layout = [%w[- - -], %w[- - -], %w[- - -]]
  @@plays = 0
  def initialize(row, column, piece)
    @row = row
    @column = column
    @piece = piece
    unless @@board_layout[@row, @column] == '-'
      @@board_layout[@row, @column] = @piece
      @@plays += 1
    end
  end

  def self.board_layout
    @@board_layout
  end

  def find_winner(board)
    winner = Game.check_victory(board) unless @@plays < 3
    winner
  end
end

winner_found = false
until winner_found != false
  puts Game.board_layout

  x_choice = gets.chomp.split() until ((x_choice.length == 2) && (x_choice[0].to_i in (0..2)) && (x_choice[1].to_i in (0..2)))
  x_move = Game.new(x_choice[0].to_i, x_choice[1].to_i, 'x')
  winner_found = true if Game.find_winner(Game.board_layout)
  puts Game.board_layout

  o_choice = gets.chomp.split() until ((o_choice.length == 2) && (o_choice[0].to_i in (0..2)) && (o_choice[1].to_i in (0..2)))
  o_move = Game.new(o_choice[0].to_i, o_choice[1].to_i, 'o')
  winner_found = true if Game.find_winner(Game.board_layout)
  puts Game.board_layout
end

puts "#{winner_found} won the game!!!"
