class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # bottom row
  [0,4,8],  # top left to bottom right win
  [6,4,2],  # top right to bottom left win
  [0,3,6],   # first col
  [1,4,7],  # second col
  [2,5,8]   # third col
]
  def initialize
    @board = Array.new(9, " ")
  end
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
def move(location, player = current_player)
  @board[location.to_i-1] = player
end
def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input)
  else
    turn
  end
  display_board

end

def play

  while over? == false
    turn
  end
  if winner == "X"
      puts "Congratulations X!"
  elsif winner == "O"
      puts "Congratulations O!"
  elsif draw? == true
      puts "Cats Game!"
   end
end
def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end


def winner
  if @board[0] == "X" && @board[1] == "X" && @board[2] == "X"
     "X"
  elsif @board[3] == "X" && @board[4] == "X" && @board[5] == "X"
      "X"
  elsif @board[6] == "X" && @board[7] == "X" && @board[8] == "X"
     "X"
  elsif @board[0] == "X" && @board[3] == "X" && @board[6] == "X"
    "X"
  elsif @board[1] == "X" && @board[4] == "X" && @board[7] == "X"
    "X"
  elsif @board[2] == "X" && @board[5] == "X" && @board[8] == "X"
    "X"
  elsif @board[0] == "X" && @board[4] == "X" && @board[8] == "X"
    "X"
  elsif @board[2] == "X" && @board[4] == "X" && @board[6] == "X"
    "X"
  elsif @board[0] == "O" && @board[1] == "O" && @board[2] == "O"
    "O"
  elsif @board[3] == "O" && @board[4] == "O" && @board[5] == "O"
    "O"
  elsif @board[6] == "O" && @board[7] == "O" && @board[8] == "O"
    "O"
  elsif @board[0] == "O" && @board[3] == "O" && @board[6] == "O"
    "O"
  elsif @board[1] == "O" && @board[4] == "O" && @board[7] == "O"
    "O"
  elsif @board[2] == "O" && @board[5] == "O" && @board[8] == "O"
    "O"
  elsif @board[0] == "O" && @board[4] == "O" && @board[8] == "O"
    "O"
  elsif @board[2] == "O" && @board[4] == "O" && @board[6] == "O"
    "O"
  else
    return nil
  end
end
def over?
  if draw? == true
    return true
  elsif won? != false
    return true
  else
    return false
  end
end
def draw?
  if full? == true && won? == false
    return true
  else
    return false
  end
end
def full?
  if @board[0] != " " && @board[1] != " " && @board[2] != " " && @board[3] != " " && @board[4] != " " && @board[5] != " " && @board[6] != " " && @board[7] != " " && @board[8] != " "
    return true
  else
    return false
  end
end
def won?
  if @board[0] == "X" && @board[1] == "X" && @board[2] == "X"
     winX =[0,1,2]
  elsif @board[3] == "X" && @board[4] == "X" && @board[5] == "X"
    winX =[3,4,5]
  elsif @board[6] == "X" && @board[7] == "X" && @board[8] == "X"
     winX =[6,7,8]
  elsif @board[0] == "X" && @board[3] == "X" && @board[6] == "X"
    winX = [0,3,6]
  elsif @board[1] == "X" && @board[4] == "X" && @board[7] == "X"
    winX = [1,4,7]
  elsif @board[2] == "X" && @board[5] == "X" && @board[8] == "X"
    winX = [2,5,8]
  elsif @board[0] == "X" && @board[4] == "X" && @board[8] == "X"
    winX = [0,4,8]
  elsif @board[2] == "X" && @board[4] == "X" && @board[6] == "X"
    winX = [2,4,6]
  elsif @board[0] == "O" && @board[1] == "O" && @board[2] == "O"
    wonO =[0,1,2]
  elsif @board[3] == "O" && @board[4] == "O" && @board[5] == "O"
    winO =[3,4,5]
  elsif @board[6] == "O" && @board[7] == "O" && @board[8] == "O"
    winO =[6,7,8]
  elsif @board[0] == "O" && @board[3] == "O" && @board[6] == "O"
    winO = [0,3,6]
  elsif @board[1] == "O" && @board[4] == "O" && @board[7] == "O"
    winO = [1,4,7]
  elsif @board[2] == "O" && @board[5] == "O" && @board[8] == "O"
    winO = [2,5,8]
  elsif @board[0] == "O" && @board[4] == "O" && @board[8] == "O"
    winO = [0,4,8]
  elsif @board[2] == "O" && @board[4] == "O" && @board[6] == "O"
    winO = [2,4,6]
  else
    return false
  end
end
def turn_count # counts positions taken
  turns = 0
  @board.each do |square| # looks at all board positions
    if square == "X" || square == "O" # checks for and X or O in each board position
      turns += 1 # for each O or X founds increases turn count
    end
  end
  return turns
end


def current_player # finds current player
  turn = turn_count # calls #turn_counter
  if turn % 2 == 0 # if turn is even
    "X"
  else # if turn is odd
    "O"
  end
end

end