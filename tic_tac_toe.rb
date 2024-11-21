require_relative 'game'
winner_found = false
until winner_found != false
  puts(Game.board_layout.map { |row| row.join(' ') })

  x_choice = [0, 1]
  o_choice = nil
  loop do
    print 'Where will X play: '
    x_choice = gets.chomp.split('').map(&:to_i)
    break if (x_choice.length == 2) && (x_choice[0].to_i in (0..2)) && (x_choice[1].to_i in (0..2))
  end
  Game.new(x_choice[0].to_i, x_choice[1].to_i, 'x')
  winner_found = Game.find_winner(Game.board_layout)
  puts(Game.board_layout.map { |row| row.join(' ') })

  loop do
    print 'Where will O play: '
    o_choice = gets.chomp.split('').map(&:to_i)
    break if (o_choice.length == 2) && (o_choice[0].to_i in (0..2)) && (o_choice[1].to_i in (0..2))
  end
  Game.new(o_choice[0].to_i, o_choice[1].to_i, 'o')
  winner_found = Game.find_winner(Game.board_layout)
  puts(Game.board_layout.map { |row| row.join(' ') })
end

puts "#{winner_found} won the game!!!"
