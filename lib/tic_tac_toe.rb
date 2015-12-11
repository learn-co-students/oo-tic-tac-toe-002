class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # Defining the WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [0, 4, 8], # Left diagonal
    [6, 4, 2]  # Right diagonal (changed from [2, 4, 6])
  ]

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def move(location, token = "X")
    @board[location.to_i-1] = token
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

  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn = ""
    turn_count.even? ? turn = "X" : turn = "O"
    turn
  end

  def won?

    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      else
        false
      end 
    end

  end

  def full?
    is_full = WIN_COMBINATIONS.all? do |win_combo|
      win_combo.all? { |item| position_taken?(item) }
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
   
    if won?
      won?.each do |t|
        return @board[t]
      end
    end
  
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # #play method ties it all together (it's tested with, learn spec/02_play_spec.rb)
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
