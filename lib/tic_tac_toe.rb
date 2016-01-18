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

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def valid_move?(location)
    location.to_i.between?(1,9) && !position_taken?(location.to_i-1)
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left to right
  [6,4,2]  # Right to left
  ]

def turn
    puts "Please enter 1-9:"
    input = gets.strip.to_i
  if valid_move?(input)
    move(input,current_player)
  else turn
  end
  display_board
end

def move (location, current_player)
    if current_player == "O"
      @board[location.to_i-1] = "O"
    else
      @board[location.to_i-1] = "X"
    end
end

def position_taken? (location)
  !(@board[location.to_i].nil? || @board[location.to_i] == " ")
end

def won?
  WIN_COMBINATIONS.each do |win_combo_array|
    if win_combo_array.all?{|position| position_taken?(position) && @board[position] == "X"}
      return win_combo_array
    elsif win_combo_array.all?{|position| position_taken?(position) && @board[position] == "O"}
      return win_combo_array
    else false
    end
  end
  false
end

def full?
  @board.all?{|position| position == "X" || position == "O" }
end

def draw?
  !full? == false
  full? && won? == false
end

def over?
  draw? || won?
end

def winner
  if over? && !draw?
    @board[won?[1]]
  end
end


def play
  while over? == false
    turn
  end
  if !won?
     puts "Cats Game!"
   elsif won? && winner == "X"
    puts "Congratulations X!"
  else
    puts "Congratulations O!"
  end
end



end
=begin

 def move
  if turn_count(board) == 0 || nil
    @board[location.to_i-1] = "X"
  elsif turn_count(board)%2 == 0
    @board[location.to_i-1] = current_player(board)
  else
     @board[location.to_i-1] = current_player(board)
   end
end

def position_taken?
  !(@board[location].nil? || @board[location] == " ")
end

  def valid_move?
  end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input)
  else 
    turn(board)
  end
  display_board(board)
end



=end


