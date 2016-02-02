class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #top left to bottom right
    [6,4,2]  #bottom left to top right
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token = current_player)
    @board[position.to_i - 1] = token
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |num|
      if num == "X" || num == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    (turn_count.even? ? "X" : "O")
  end

  def won?
    array = false

    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && 
         @board[combo[1]] == "X" && 
         @board[combo[2]] == "X" || 
         @board[combo[0]] == "O" && 
         @board[combo[1]] == "O" && 
         @board[combo[2]] == "O"
        array = [combo[0],combo[1],combo[2]]
      end
    end

    return array
  end

  def full?
    @board.each do |token|
      if token == " "
        return false
      end
    end
  end

  def draw?
    if full? && !won?
      return true
    elsif !won? && !full?
      return false
    else
      return false
    end
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    # boardwon = won?
    if won? == false
      return nil
    else 
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
      current_player
    end
    if winner == nil
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end