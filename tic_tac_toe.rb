require_relative 'game'
winner_found = false
until winner_found != false
  Game.print_board(Game.board_pieces)

  x_choice = [0, 1]
  o_choice = nil
  loop do
    print 'Where will X play: '
    x_choice = gets.chomp.split('').map(&:to_i)
    break if (x_choice.length == 2) && (x_choice[0].to_i in (0..2)) && (x_choice[1].to_i in (0..2)) &&
             Game.board_pieces[x_choice[0]][x_choice[1]] == '-'
  end
  Game.new(x_choice[0].to_i, x_choice[1].to_i, 'x')
  winner_found = Game.winner(Game.board_pieces)
  Game.print_board(Game.board_pieces)
  break unless winner_found == false

  if Game.board_pieces.flatten.include?('-') == false
    winner_found = 'No one'
    break
  end

  loop do
    print 'Where will O play: '
    o_choice = gets.chomp.split('').map(&:to_i)
    break if (o_choice.length == 2) && (o_choice[0].to_i in (0..2)) && (o_choice[1].to_i in (0..2)) &&
             Game.board_pieces[o_choice[0]][o_choice[1]] == '-'
  end
  Game.new(o_choice[0].to_i, o_choice[1].to_i, 'o')
  winner_found = Game.winner(Game.board_pieces)
  unless winner_found == false
    Game.print_board(Game.board_pieces)
    break
  end
end

puts "#{winner_found} won the game!!!"
