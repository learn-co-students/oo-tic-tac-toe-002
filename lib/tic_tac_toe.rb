class TicTacToe

  WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],
  [0,3,6],[1,4,7],[2,5,8],
  [0,4,8],[6,4,2]
  ]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, char)
    @board[position - 1] = char
    @board
  end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == ""
      return false
    elsif @board[position] == nil
      return false
    elsif @board[position] == "X"  || @board[position] == "O"
      return true
    end
  end

  def valid_move?(position)
    if position.to_i.between?(1,9) == false
      return false
    else
      position = position.to_i - 1
    end

    if @board == []
      return true
    end

    if position_taken?(position)
      return false
    #ooooh if the position is take, it's NOT a valid move lol
    else
      return true
    end
  end

  def turn_count
    @board.select {|position| position == "X" || position == "O"}.size
  end

  def current_player
  #lol originally had something else that was more complicated to do this
  #but i think they're trying to help you out by having you write the methods in this order
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp.to_i #was something else til we put it in the loop
    if valid_move?(input)
      move(input,current_player)
      display_board
    else
      while !valid_move?(input)
        puts "Please enter 1-9:"
        input = gets.chomp.to_i
        if valid_move?(input)
          move(input,current_player)
          display_board
          break
        end
      end
    end
  end

  def won?
    if @board.all?{|x| x == " "}
      return false
    end
    status = WIN_COMBINATIONS.select do |combo|
    #this condition seems pretty janky lol
      (position_taken?(combo[0]) && position_taken?(combo[1]) && position_taken?(combo[2])) && (@board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]])
    end

    if !status.empty?
      return status[0]
    end
  end

  def full?
    @board.none? {|position| position == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
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