class TicTacToe

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], 
[0,3,6], [1,4,7], [2,5,8], 
[0,4,8], [6,4,2]
]
    def initialize(board = Array.new(9, " "))
      @board = board 
    end


    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def move(position, letter = "X")
      @board[position.to_i - 1] = letter
    end

    def position_taken?(position)
      @board[position].match(/[XO]/) ? true : false
    end

    def valid_move?(position)
      return true if position_taken?(position.to_i - 1) == false && position.to_i.between?(1,9)
      false
    end

    def turn
      puts "Please enter 1-9"
      input = gets.to_i

        while true 
          if valid_move?(input)
            move(input, current_player)
            break
          else
            puts "invalid try again"
            input = gets.to_i
          end
        end
    end

    def turn_count
        @board.select { |el| el.match(/[XO]/) }.count 
    end

    def current_player
      turn_count == 0 || turn_count.even? ? "X" : "O"
    end

    def won?
      WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ||
           @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return true
        end
      end
          false 
    end

    def full?
      if @board.all? { |el| el == "X" || el == "O" }
        true
      else
        false
      end
    end

    def draw?  # true on a draw, false on a win or in progress
      if full? && won? == false 
        return true 
      end
        false 
    end

    def over?
      if draw? || won? || full?
        return true
      end
        false
    end

    def winner
      if won?
        WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ||
           @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
           return @board[combo[0]]
         end
       end
      end
    end

    def play
      until over?
        display_board
        turn 
      end

      if won?
        display_board
        puts "Congratulations #{winner}!"
      else
        display_board
        puts "Cats Game!"
      end


    end




end