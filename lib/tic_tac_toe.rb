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
  [0,4,8],
  [6,4,2]

  # ETC, an array for each win combination
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, character="X")
    @board[location-1] = character
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position = position.to_i
    return position >= 1 && position <= 9 && !position_taken?(position-1)
  end

  def turn
    puts "Enter a move"
    input = gets.chomp.to_i
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    return 9 - @board.count(" ")
  end

  def current_player
    if @board.count("O") < @board.count("X")
      return "O"
    else
      return "X"
    end
  end

  def full?
    !@board.include?(" ") #if there is an empty space, then not full
  end

  def over?
    return won? || draw?
  end

  def draw?
    return !won? && full?
  end

  def won?
    for win_combo in WIN_COMBINATIONS
      position1 = @board[win_combo[0]]
      position2 = @board[win_combo[1]]
      position3 = @board[win_combo[2]]
      if position1 == position2 && position2 == position3 && position1 != " "
        return win_combo
      end
    end
    return false
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end


  def play
    while !over?
      turn
    end
    champion = winner
    if champion
      puts "Congratulations #{champion}!"
    else
      puts "Cats Game!"
    end
  end

end