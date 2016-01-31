class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[6,4,2],[0,3,6],[1,4,7],[2,5,8]]
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def move(location, player = "X")
    @board[location.to_i-1] = player
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

  def won?
    WIN_COMBINATIONS.each do |wc|
      i1 = wc[0]
      i2 = wc[1]
      i3 = wc[2]
      p1 = @board[i1]
      p2 = @board[i2]
      p3 = @board[i3]
      if position_taken?(i1) && position_taken?(i2) && position_taken?(i3)
        if p1 == p2 && p1 == p3 && p2 == p3
          return wc
        end
      end
    end
    return nil
  end

  #full? method
  def full?
    !@board.any?{|i| i == " " || i == nil} && !won?
  end

  #draw? method
  def draw?
    full? && !won?
  end

  #over? method
  def over?
    full? || won? || draw?
  end

  #winner method
  def winner
    ret = won?
    if ret
      return @board[ret[0]]
    end
  end

  # Define your play method below
  def play
    until over?
      turn
    end #until

    if won?
       puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cats Game!"
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end