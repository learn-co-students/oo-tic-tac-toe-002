class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  def board
    @board
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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
def move(board, token = current_player)
  @board[board.to_i-1] = token
end

def position_taken?(board)
  @board[board.to_i] != " " && @board[board.to_i] != ""
end

def valid_move?(board)
  board.to_i.between?(1,9) && !position_taken?(board.to_i-1)
end

def turn
  puts "Please enter 1-9:"
  board = gets.strip
  if valid_move?(board)
    move(board)
  else
    turn
  end
    display_board
end

def turn_count
  counter = 0
  @board.each do |position|
    if position != " "
      counter += 1
    end
  end
  return counter
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.any? do |i|
    if @board[i[0]] == "X"  && @board[i[1]] == "X" && @board[i[2]] == "X" ||
       @board[i[0]] == "O"  && @board[i[1]] == "O" && @board[i[2]] == "O"
      return i
      else false
    end
  end
end

def full?
  board.all?{|position| position != " "}
end

def draw?
  full? && !won?
end

def over?
  full? || won? || draw?
end

def winner
  if !won?
    nil
  end
  if won?
    WIN_COMBINATIONS.any? do |i|
    if @board[i[0]] == "X"  && @board[i[1]] == "X" && @board[i[2]] == "X"
      return "X"
      elsif @board[i[0]] == "O"  && @board[i[1]] == "O" && @board[i[2]] == "O"
      return "O"
    end
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