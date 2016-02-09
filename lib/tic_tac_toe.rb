class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def move(position, value = "X")
    @board[position.to_i-1] = value
  end
def position_taken?(position)
  position = position.to_i
  if @board[position] == " "
    return false
  elsif @board[position] == ""
    return false
  elsif @board[position] == nil
    return false
  elsif @board[position] == "X"
    return true
  elsif @board[position] == "O"
    return true
  end
end
def valid_move?(position)
  position = position.to_i
  position = position - 1
  if position.between?(0,8) && !position_taken?(position)
      return true
  else
    return false
  end
end
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input) == true
    value = current_player
    move(input, value)
    display_board
  else
    puts "Invalid input. Please try again."
    display_board
    turn
  end
end
def turn_count
  counter = 0
  @board.each do |position|
    if position != " "
      counter = counter + 1
    end
  end
  return counter
end
def current_player
  if turn_count % 2 != 0
    return "O"
  else
    return "X"
  end
end
def won?
  WIN_COMBINATIONS.each do |combo|
    win_index1 = combo[0]
    win_index2 = combo[1]
    win_index3 = combo[2]
    array_1 = [@board[win_index1], @board[win_index2], @board[win_index3]]
    if array_1 == ["X","X","X"]
      return combo # return the win_combination indexes that won.
    elsif array_1 == ["O","O","O"]
      return combo
    end
  end
  return false
end
def full?
  !(@board.any? {|position| position == " " })
end
def draw?
  if (won? == true)
    return false
  elsif ((won? == false) && (full? == false))
    return false
  elsif ((won? == false) && (full? == true))
    return true
  end
end
def over?
  if won? || full? || draw?
    return true
  else
    return false
  end
end
def winner
  if won?
  character = won?[0]
  @board[character]
  end
end
def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end
end