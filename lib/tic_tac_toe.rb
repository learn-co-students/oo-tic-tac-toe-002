class TicTacToe

  def initialize
    @board ||= Array.new(9, " ")
    @winner = nil
  end

  WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #first column
  [1, 4, 7], #second column
  [2, 5, 8], #third column
  [0, 4, 8], #first diagonal
  [2, 4, 6] #second diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, current_player = "X")
    if valid_move?(position)
      @board[position-1] = current_player
    else
     return false
    end 
  end
  
  #accepts an integer 0-8
  def position_taken?(position)
    @board[position] != " "
  end

  #accepts a string - checks if it is of a number on the board
  def valid_move?(move)
    move = move.to_i if move.is_a? String
    return false unless move.is_a? Integer
    move.between?(1, 9) && !position_taken?(move-1) 
  end

  def turn(input = gets.strip.to_i)
    while (move(input, current_player) == false) do
      puts "invalid"
      input = gets.strip.to_i
    end
  end

  def turn_count
    @board.count {|cell| is_occupied?(cell) }
  end

  def is_occupied?(cell)
    !(cell.strip.empty?)
  end

  def current_player    
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combination|
      position_1 = @board[combination[0]]
      position_2 = @board[combination[1]]
      position_3 = @board[combination[2]]

      if ((position_1 == "X" || position_1 == "O") && (position_1 == position_2) && (position_2 == position_3))
        @winner = position_1
        return true
      end
    end
    return false
  end
  
  def full?
    @board.all? {|cell| is_occupied?(cell)}
  end

  def draw?
    self.full? && !self.won?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if won? 
      @winner
    end
  end

  def play
    #game loop
    while !over?
      display_board
      puts "#{current_player}, where would you like to move?"
      turn(gets.strip.to_i)
    end    

    #ending statements
    if !winner
      puts "Cats Game!"
    else 
      puts "Congratulations #{winner}!"
    end
  end

end
