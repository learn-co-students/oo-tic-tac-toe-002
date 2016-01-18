class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  def board
    puts @board.inspect
  end
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
   WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]
 ]
 def move(location, player="X")
  player = current_player
   @board[location.to_i-1] = player
   display_board
 end

 def position_taken?(location)
    array_location = location.to_i
    if @board[array_location] == "X" || @board[array_location] == "O"
      true
    else
      false
    end
 end

 def valid_move?(location)
  location = location.to_i
   if (1..9).include?(location) && position_taken?(location-1) == false
     true
   else
     false
   end
 end

 def turn
  puts "Please enter your position"
  location = gets.chomp
  player = current_player
   while valid_move?(location)==false
      puts "That is an invalid move please re-enter"
      location = gets.chomp
   end
   move(location, player)
   puts current_player
 end

  def turn_count
    count = 0 
    @board.each do |position|
      if position == "X" || position =="O"
        count+=1
      end
    end
    return count 
  end

  def current_player
    if turn_count%2 == 0 
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0] 
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      if @board[win_index_1] == "X" && @board[win_index_2]=="X" && @board[win_index_3]=="X" || @board[win_index_1] == "O" && @board[win_index_2]=="O" && @board[win_index_3]=="O"
        return win_combination
      end
    end
    false
  end

  def full?
    if turn_count == 9
      true
    else
      false
    end
  end

  def draw?
    if full? && won? == false
      true
    else
      false
    end
  end

  def over?
    if full? || won?
      true
    else
      false
    end
  end

  def winner
    if won?
     @board[won?[0]]
    else
      nil
    end
  end

  def play
    display_board
    while over? == false && draw? == false
     turn
     player = current_player
    end

    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cats Game!"
    end
  end

 # End of class
end

