require_relative 'check_winner'
class Game
  include CheckVictory
  @@board_layout = [%w[- - -], %w[- - -], %w[- - -]]
  @@plays = 0
  def initialize(row, column, piece)
    @row = row
    @column = column
    @piece = piece
    return if @@board_layout[@row][@column] != '-'

    @@board_layout[@row][@column] = @piece
    @@plays += 1
  end

  def self.board_layout
    @@board_layout
  end

  def self.winner(board)
    return false if @@plays < 3

    CheckVictory.find_winner(board)
  end
end
