class TicTacToe

def initialize
  @board = Array.new(9, " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def display_board
  sep = "-----------"
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts sep
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts sep
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(num, char="X")
  @board[num.to_i - 1] = char
end

def position_taken?(position)
  if @board[position] == "" || @board[position] == " " || @board[position] == nil
    false
  elsif @board[position] == "X" || @board[position] == "O"
    true
  end
end

def valid_move?(position)
  position = position.to_i
  if position_taken?(position - 1) || !(position.between?(1, 9))
    false
  else
    true
  end
end

def position_taken?(position)
  if @board[position] == "" || @board[position] == " " || @board[position] == nil
    false
  elsif @board[position] == "X" || @board[position] == "O"
    true
  end
end

def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if !valid_move?(position)
    turn
  end
  move(position, current_player)
  display_board
end

def turn_count
  counter = 0
  @board.each do |i|
    if i == "X" || i == "O"
      counter += 1
    end
  end
  counter
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
    WIN_COMBINATIONS.any? do |arr|
      win_index_1 = arr[0]
      win_index_2 = arr[1]
      win_index_3 = arr[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || 
         position_1 == "O" && position_2 == "O" && position_3 == "O"
         return arr
      else
        false
      end
    end
end

def full?
  @board.all? { |position| position == "X" || position == "O" } ? true : false
end

def draw?
  if !(won?) && full?
    true
  elsif !won? && !full?
    false
  elsif won?
    false
  end
end

def over?
  (won? || draw? || full?) ? true : false
end

def winner
  if !won?
    nil
  elsif won?
    win = won?
    char = @board[win[0]]
    if char == "X"
      "X"
    elsif char == "O"
      "O"
    end
  end
end

def play
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end

end
