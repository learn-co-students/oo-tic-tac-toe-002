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
    @board = Array.new(9, " ")
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, chart = "X")
    @board[position - 1] = chart
  end

  def position_taken?(position)
    @board[position] != " "
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && !position_taken?(position.to_i - 1)
  end

  def turn
    position = "0"
    until valid_move?(position) do
      puts "Please input 1-9:"
      position = gets.chomp
    end
    move(position.to_i, current_player)
    display_board
  end

  def turn_count
    @board.count{|token| token != " "}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |c|
      if @board[c[0]] == @board[c[1]] && @board[c[1]] == @board[c[2]] && @board[c[0]] != " "
        return c
      end
    end
    false
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end