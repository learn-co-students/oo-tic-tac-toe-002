
class TicTacToe
	def initialize(board= nil)
		@board = board || Array.new(9,' ')
	end

	WIN_COMBINATIONS=[	[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]
]

	def display_board
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
	  puts "-----------"
	  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	  puts "-----------"
	  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end
 
	def move(position, player)
		player = current_player 
		@board[position.to_i-1] = player 
	end

	def position_taken?(position)
		@board[position] != ' '
	end

	def valid_move?(position)
		position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
	end

	def turn
		puts "Please enter 1-9:"
		input = gets.chomp
		if valid_move?(input.to_i)
			move(input, current_player)
		else
			puts "Sorry, invalid move"
			turn
		end
	end

	def turn_count
		@board.select{ |x| x == 'X' || x == 'O'}.size
	end

	def current_player
		turn_count.even? ? 'X' : 'O'
	end

	def won?
		WIN_COMBINATIONS.each do |winning|
			a,b,c = winning[0], winning[1], winning[2]
			if @board[a] == 'X' && @board[b] == 'X' && @board[c] == 'X'
				return winning 
			elsif @board[a] == 'O' && @board[b] =='O' && @board[c] == 'O'
				return winning
			else
				nil
			end
		end
		nil
	end

	def full?
		!@board.detect{ |x| x == ' '}
	end

	def draw?
		self.full? && (self.won? == nil ) 
	end

	def over?
		self.full? || self.draw? 
	end

	def winner
		winning_combo = self.won? 
		return @board[winning_combo[0]] if !winning_combo.nil? 
	end


	def play
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

end




