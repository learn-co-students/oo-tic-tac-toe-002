class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [3,4,5],
    [6,7,8],
    [6,4,2]
  ]

  def display_board

  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def move(location, token = "X")
  @board[location -= 1] = token
end

def position_taken?(input)
  if !(@board[input].nil? || @board[input] == " " || @board[input] == "")
    true
  else
    false
end
end

def valid_move?(position)

  !position_taken?(position.to_i-1) && position.to_i.between?(1,9)

end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input.to_i, current_player)
  else
    turn
  end
  display_board
end




def turn_count
  @board.count{|tokens| tokens == "X" || tokens == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index = win_combination
          position_1 = @board[win_index[0]]
          position_2 = @board[win_index[1]]
          position_3 = @board[win_index[2]]



    if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
      elsif   position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
      end

  end
  if @board ==  [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      false
    end

end

def full?
  @board.all?{|index| index == "X" || index == "O"}
end

def draw?
  !won? && full? ? true : false
end

def over?
  won? || draw? || full? ? true : false
end

  def winner

    WIN_COMBINATIONS.each do |win_combo|
      if win_combo.all? {|index| @board[index] == "X" }
         return "X"
      elsif win_combo.all? {|index| @board[index] == "O"}
         return  "O"
      end
      end
      nil
  end

def play

  while !over?
    turn
  end

  if won?
       puts "Congratulations #{winner}!"
    elsif draw?
       puts "Cats Game!"
    end

end
end