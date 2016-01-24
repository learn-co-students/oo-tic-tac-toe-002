class TicTacToe
  def initialize()
    @board = [" "," "," "," "," "," "," "," "," ",]
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def play
  #input = gets.strip
  until over? do
    turn
  end

  if won?
    winnername = winner == "X" ? "X" : "O"
    puts "Congratulations #{winnername}!"
  elsif draw?
   puts "Cats Game!"
  else
   false
  end
end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
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
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    player = turn_count.even? ? "X" : "O"

    return player
  end


  def won?
    draw = @board.none? do |position|
      position == " "
    end

    empty = @board.all? do |position|
      position == " "
    end

    WIN_COMBINATIONS.each do |combination|
      winposition1 = @board[combination[0]]
      winposition2 = @board[combination[1]]
      winposition3 = @board[combination[2]]

      if empty
        return false
      elsif winposition1 == "X" && winposition2 == "X" && winposition3 == "X"
        return combination
      elsif winposition1 == "O" && winposition2 == "O" && winposition3 == "O"
        return combination
      else
        false
      end
    end
    if draw
      return false
    end
  end

  def full?
    full = @board.all? do |position|
      position == "X" || position == "O"
    end

    if full
      return true
    else
      return false
    end
  end

  def draw?
    if won?
      return false
    elsif full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || full? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end
end

