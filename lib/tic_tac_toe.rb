class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board=(set_board)
    @board = set_board
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],[3, 4, 5],[6, 7, 8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]
]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, player = "X")
    position = position.to_i
    @board[position-1] = player
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

  # code your #valid_move? method here
  def valid_move?(position)
    position = position.to_i
    
    if !(position_taken?(position-1)) && position.between?(1,9)
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end


  def turn_count
    number_of_turns_played = 0
    @board.each do |num|
      if (num == "X") || (num == "O")
        number_of_turns_played += 1
      end
    end
    return number_of_turns_played
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && position_taken?(win_combination[0])    
    end
  end

  def full?
    board.none?{|i| i ==" "} || false
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end

  def winner
    if winner = won?
      board[winner[0]]
    end
  end

  # Define your play method below
  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner[0]}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end