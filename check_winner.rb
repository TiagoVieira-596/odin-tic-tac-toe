module CheckVictory
  def self.check_victory_lines(board)
    winner = { 'x': false, 'o': false, '-': false }
    current_board = board.flatten

    [0, 3, 6].each do |start_index|
      if current_board[start_index] == current_board[start_index + 1] && current_board[start_index + 1] == current_board[start_index + 2]
        winner[current_board[start_index]] = true
      end
    end
    [0, 1, 2].each do |start_index|
      if current_board[start_index] == current_board[start_index + 3] && current_board[start_index + 3] == current_board[start_index + 6]
        winner[current_board[start_index]] = true
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

  def self.check_victory_cross(board)
    winner = { 'x': false, 'o': false, '-': false }
    current_board = board.flatten

    if current_board[0] == current_board[4] && current_board[4] == current_board[8]
      winner[current_board[0]] = true
    elsif current_board[2] == current_board[4] && current_board[4] == current_board[6]
      winner[current_board[2]] = true
    end

    if winner['x']
      'x'
    elsif winner['o']
      'o'
    else
      false
    end
  end

  def self.find_winner(board)
    winner_lines = CheckVictory.check_victory_lines(board)
    winner_cross = CheckVictory.check_victory_cross(board)
    return false unless winner_lines || winner_cross

    if winner_lines == 'x' || winner_cross == 'x'
      'X'
    elsif winner_lines == 'o' || winner_cross == 'o'
      'O'
    else
      false
    end
  end
end
