class TicTacToe

  def initialize
    @board = Array.new(9," ")
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  WIN_COMBINATIONS =[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def move (position, character = "X")
    location = position.to_i - 1
    @board[location] = character
  end

  def position_taken?(location)
    if @board[location] == " "
      false
    elsif @board[location] == ""
      false
    elsif @board[location] == nil
      false
    else
      true
    end
  end

  def valid_move?(position)
    location = position.to_i - 1
    if location.between?(0, 8) && !position_taken?(location)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    move = gets.strip

    while !valid_move?(move)
      puts "Please enter a value thats not taken:"
      move = gets.strip
    end
      move(move, current_player)
  end

  def turn_count
    turn_number = @board.count("X") + @board.count("O")
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else 
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |winning_combos|
      @winning = winning_combos.map do |space|
        @board[space]
      end
      return winning_combos if @winning.count("X") == 3 || @winning.count("O") == 3
    end
    return false
  end

  def full?
    if @board.count("X") + @board.count("O") == 9
      true
    else
      false
    end
  end

  def draw?
    if won?
      false
    elsif full?
      true
    else
      false
    end
  end

  def over?
    if draw?
      true
    elsif won?
      true
    else
      false
    end
  end

  def winner
    return puts "Cats Game!" unless won?

    if @winning.count("X") == 3
      puts "Congratulations X!"
      "X"
    else
      puts "Congratulations O!"
      "O"
    end
  end

  def play
    until over?
      turn
    end
    winner
  end
end