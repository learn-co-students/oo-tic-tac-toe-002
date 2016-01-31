class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [6,4,2],
  [0,4,8]
   ]

  def display_board
    print " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
    print "-----------\n"
    print " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
    print "-----------\n"
    print " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end

  def move(position, char = "X")
    position = position.to_i - 1
    @board[position] = char
  end

  def position_taken?(position)
    if ((@board[position] == "X") || (@board[position] == "O" ))
      return true
    elsif @board[position] == nil
      false
    else
      false
    end
  end

   def valid_move?(position)
      num = (position.to_i)-1
     if (((0..8) === num) && (@board[num] == " "))
      return true
     else
      false
     end
   end

    def turn
      print "Please pick 1-9 \n"
      position = gets.strip
      if valid_move?(position)
        char = current_player
        move(position, char)
        display_board
      else
        turn
      end

    end

    def turn_count
     count = 0
     @board.each do |turn|
        if ((turn == "X") || (turn == "O"))
           count += 1
        end
      end
      return count
     end

    def current_player
      if turn_count.odd?
        return "O"
      else
        return "X"
      end
    end

    def won?
      combo = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [6,4,2],
      [0,4,8]
      ]
      count = 0
      while count <=7
        win_index_1 = combo[count][0]
        win_index_2 = combo[count][1]
        win_index_3 = combo[count][2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]
        if (((position_1 == "X") && (position_2 == "X") && (position_3 == "X") ) ||((position_1 == "O") &&
          (position_2 == "O") && (position_3 == "O")))
            return combo[count]
        elsif
          false
        end
      count += 1
      end
    end

def full?
  if @board.all? {|piece| (piece == "X" )||(piece == "O")}
    return true
 else
    false
 end
end

def draw?
  if full? && !won?
    return true
  else false
  end
end

def over?
  if (full? || won? || draw?)
    return true
  else false
  end
end

def winner
  if won?
       arry = won?
         modarry = (@board[arry[0]..arry[2]]).select {|x| x == "X"}
         modarry2 = (@board[arry[0]..arry[2]]).select {|x| x == "O"}
      if modarry == ["X","X","X"]
        return "X"
      end

      if  modarry2 == ["O","O","O"]
        return "O"
      end
  else
      return nil
  end
end

  def play
    until over?
     turn
    end
     if won?
       if  winner == "O"
           puts "Congratulations O!"
        else winner == "X"
           puts "Congratulations X!"
        end
     elsif draw?
       puts "Cats Game!"
     end
  end

end