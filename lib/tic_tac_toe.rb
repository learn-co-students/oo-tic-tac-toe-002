class TicTacToe
   def initialize(board= nil)
     @board = board || Array.new(9,' ')
   end
WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
def play
   won?
	until over? || won?
		turn

	end
	if won?
		puts "Congratulations #{winner}!"
   end
	if draw?
		puts "Cats Game!"
	end
end

def move(position, player='X')
	@board[(position.to_i) -1] = player
end

def position_taken?(position)
	!(@board[position].nil? || @board[position] == ' ')
end

def valid_move?(position)
		position.to_i.between?(1,9) && !position_taken?((position.to_i)-1)
end

def turn_count
	@board.reject{|x| x == ' '}.size
end

def current_player
	turn_count.even? ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
  input = ''
  input = gets.chomp
  if valid_move?(input)
  	move(input, current_player)
  else
  	turn
  end
  display_board
end
def won?
	WIN_COMBINATIONS.each do |winning|
		a,b,c = winning[0], winning[1], winning[2]
		if @board[a] == 'X' && @board[b] == 'X' && @board[c] == 'X'
			return winning
		elsif @board[a] == 'O' && @board[b] == 'O' && @board[c] == 'O'
			return winning
		end
	end
	nil
end


def full?
	!@board.detect {|x| x == ' '}
end


def draw?
	full? && won?.nil?
end

def over?
	draw? || !won?.nil?
end

def winner
	winner = won?
	unless winner.nil?
		@board[winner[0]]
	end
end
end