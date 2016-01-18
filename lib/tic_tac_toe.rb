class TicTacToe

  def initialize(board = "nil")
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def move(input, current_player="X")
    @board[input.to_i - 1] = current_player
  end

  def position_taken?(input)
    @board[input] != " " && @board[input] != ""
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    display_board
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |board_location|
      if board_location == "X" || board_location == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count.even?
      return "X"
    else turn_count.odd?
      return "O"
    end
  end

  def won?
  WIN_COMBINATIONS.detect do |win_combination|
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
        win_combination
      elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
        win_combination
      else
      end
    end
  end

  def full?
    @board.all? do |board_index|
      if board_index == " "
        false
      else
        true
      end
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
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    if won? == nil
      return nil
    elsif @board[won?[0]] == "X"
      return "X"
    else
      return "O"
    end
  end

  def play
    while !over?
      turn
    end
    display_board
    if !draw?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cats Game!"
    end
  end

end