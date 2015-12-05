class TicTacToe

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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, character = "X")
    input = input.to_i
    @board[input - 1] = character
    return @board
  end
    
  def position_taken?(location)

    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn()
    display_board()
    puts "Please enter 1-9:"
    player = current_player()
    input = gets.strip
    if valid_move?(input)
      move(input, player)
    else
      turn()
    end
  end
  

  def turn_count()
    turn_count = 9
    @board.each do |position|
      if position == " "
        turn_count -= 1
      end
    end
    return turn_count
  end

  def current_player()
    if turn_count().even?
      return "X"
    else
      return "O"
    end
  end

  def won?()
    WIN_COMBINATIONS.any? do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      else
        false
      end
    end
  end

  def full?()
    spot = 0
    9.times do
      if position_taken?(spot)
        spot += 1
      else
          return false
      end      
    end
  end

  def draw?()
    if full?()
      if won?()
        return false
      else
        return true
      end
    else
      return false
    end
  end

  def over?()
    draw? || won?
  end

  def winner()
    if won? == false
      return nil
    else
      winning_array = won?
      winning_character = @board[winning_array[0]]
      return winning_character
    end
  end

  def play()
    until over? do
      turn()
    end
    if won?
      display_board()
      winner = winner()
      puts "Congratulations #{winner}!"
    elsif draw?
      display_board
      puts "Cats Game!"
    end
  end
end


