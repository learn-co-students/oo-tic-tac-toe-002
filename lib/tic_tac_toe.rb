class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

WIN_COMBINATIONS = [
  [0,1,2], #Top
  [3,4,5], #Middle
  [6,7,8], #Bottom
  [0,3,6], #Left
  [1,4,7], #Middle
  [2,5,8], #Right
  [0,4,8], #Diagonal Right
  [6,4,2]  #Diagonal Left
  ]

def move(location, player = "X")
  @board[location.to_i-1] = player
end


def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end


def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i - 1)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input, current_player)
  else
    turn
  end
  display_board
end

def turn_count
  count = 0
  @board.each do |slot|
    if slot == "X" || slot == "O"
      count += 1
    end
  end
  count
end

def current_player
  if turn_count % 2 == 0
     "X"
  else
     "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
  end
end

def full?
  @board.all?{|player| player=="X" || player=="O"}
end

def draw?
  !won? && full?
end

def over?
  won? || full? || draw?
end

def winner
  if won?
    winning_combo = won?
    @board[winning_combo.first]
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
