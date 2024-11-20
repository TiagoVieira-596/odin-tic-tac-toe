module CheckVictory
  def check_victory_lines(board)
    winner = { 'x': false, 'o': false, '-': false }
    current_board = board.flatten
    current_board.each_with_index do |spot, index|
      break if winner['x'] || winner['o']

      if [0, 3, 6].include?(index)
        if current_board[index] == spot && current_board[index + 1] == spot && current_board[index + 2] == spot
          winner[spot] = true
        end
      elsif index in [0, 1, 2]
        if current_board[index] == spot && current_board[index + 3] == spot && current_board[index + 6] == spot
          winner[spot] = true
        end
      end
    end
    if winner['x']
      'x'
    elsif winner['o']
      'o'
    else
      false
    end
  end

  def check_victory_cross(board)
    winner = { 'x': false, 'o': false, '-': false }
    current_board = board.flatten
    current_board.each_with_index do |spot, index|
      break if winner['x'] || winner['o']

      if index.zero?
        if current_board[index] == spot && current_board[index + 4] == spot && current_board[index + 8] == spot
          winner[spot] = true
        end
      elsif index == 2
        if current_board[index] == spot && current_board[index + 2] == spot && current_board[index + 4] == spot
          winner[spot] = true
        end
      end
    end

    if winner['x']
      'x'
    elsif winner['o']
      'o'
    else
      false
    end
  end

  def check_victory(board)
    winner_lines = check_victory_lines(board)
    winner_cross = check_victory_cross(board)
    return false unless winner_lines || winner_cross

    if winner_lines == 'x' || winner_cross == 'x'
      'x'
    elsif winner_lines == 'o' || winner_cross == 'o'
      'o'
    else
      false
    end
  end
end
