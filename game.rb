require_relative 'check_winner'
class Game
  include CheckVictory
  @@board_pieces = [%w[- - -], %w[- - -], %w[- - -]]
  @@plays = 0
  def initialize(row, column, piece)
    @row = row
    @column = column
    @piece = piece
    return if @@board_pieces[@row][@column] != '-'

    @@board_pieces[@row][@column] = @piece
    @@plays += 1
  end

  def self.board_pieces
    @@board_pieces
  end

  def self.winner(board)
    return false if @@plays < 3

    CheckVictory.find_winner(board)
  end

  def self.print_board(pieces)
    board_layout = "     |     |
  #{pieces[0][0]}  |  #{pieces[0][1]}  |  #{pieces[0][2]}
_____|_____|_____
     |     |
  #{pieces[1][0]}  |  #{pieces[1][1]}  |  #{pieces[1][2]}
_____|_____|_____
     |     |
  #{pieces[2][0]}  |  #{pieces[2][1]}  |  #{pieces[2][2]}
     |     |     "
    puts board_layout
  end
end
