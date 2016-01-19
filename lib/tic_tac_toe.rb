class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

    def move(location, current_player="X")
      @board[location.to_i-1] = current_player
    end

    def position_taken?(position)
      if @board[position] == " "
        false
      else
        true
      end
    end

    def valid_move?(position)
      position = (position.to_i - 1)
      if position.between?(0, 8) && !position_taken?(position)
        true
      else
        false
      end
    end

    def turn
      display_board
      puts "Please enter 1-9:"
      input = gets.chomp

      while true
        if valid_move?(input)
          move(input.to_i, current_player)
          break
        else
          puts "Invalid - please try again"
          display_board
          puts "Please enter 1-9:"
          input = gets.chomp
        end
      end
    end

    def turn_count
      counter = 0
      @board.each do |turn|
        if turn == "X" || turn == "O"
          counter +=1
        end
      end
      counter
    end

    def current_player
      turn_count % 2 ==0? "X" : "O"
    end

    def won?
      WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ||
          @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        end
      end
      false
    end

    def full?
      return true if @board.all? {|a| a.match (/[XO]/)}
      false
    end

    def draw?
      return true if full? && won? == false
      false
    end

    def over?
      return true if full? || won? || draw?
      false
    end

    def winner
      if won?
        @board[won?[0]]
      end
    end

    def play
      until over?
        turn
      end

      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cats Game!"
      end
    end
end